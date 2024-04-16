#  API7:2023 - Server Side Request Forgery (SSRF)
import requests
import random
import string
import time
from selenium import webdriver
import difflib
from selenium.webdriver.chrome.options import Options
import copy
import helpers.color_text as color
import helpers.file_reader as reader
import re

def generate_random_string(length):
    # Define the characters to choose from
    characters = string.ascii_letters + string.digits
    # Generate a random string
    random_string = ''.join(random.choice(characters) for i in range(length))
    return random_string


def monitor_changes(initial_state, driver, verbose, interval=5, attempts=1):
    initial_state = initial_state

    for _ in range(attempts):
        # Wait for the specified interval
        time.sleep(interval)
        
        # Fetch the current state of the page
        current_state = driver.page_source
        
        # Compare the current state with the initial state
        if current_state != initial_state and "remoteaddr" in current_state: # remoteaddr is only visible when callbacks are captured.
            color.red("SSRF vulnerability detected!")
            initial_state = current_state
            if verbose:
               color.verbose("Current State of Request Catcher URL:\n") 
               print(current_state)
            
            return True
        
        else:
            if verbose:
              color.verbose("No change detected.")
  
    if verbose:      
      color.verbose("Monitoring completed.")




def check_api_7(endpoint, method : str, headers: dict, timeout : float, verbose : bool, data : str = None, json : dict = None, response = None):
  color.banner("------------------------ API7:2023 - Server Side Request Forgery (SSRF) ------------------------")
  vulnerabilities = []
  color.warning("Launching SSRF attacks, might take some times to finish.")
  #TODO: maybe implement Firefox extension in the future.
  # use https://requestcatcher.com/ to capture callbacks in case there is SSRF vulnerability.
  chrome_options = Options()
  chrome_options.add_argument('--ignore-certificate-errors')
  chrome_options.add_argument("--headless")  # Ensures Chrome runs in headless mode
  chrome_options.add_argument("--disable-gpu")
  chrome_options.add_argument("--incognito")
  #chrome_options.add_argument("--disable-cache")



  catcher_url = "https://" + generate_random_string(20).lower() + ".requestcatcher.com"
  
  
  print(f"Using {catcher_url.lower()} URL to receive callbacks from SSRF attacks.")
  color.warning(f"Don't browse to this URL directly otherwise this test will produce false positive.") 

  driver = webdriver.Chrome(options=chrome_options) 

  driver.get(catcher_url)

  # Wait for JavaScript to load (optional, depends on the case)
  driver.implicitly_wait(10)  # Waits for 10 seconds for the elements to become available

  # Now you can access the page source after JavaScript has been executed
  initial_state = driver.page_source
  if verbose:
    color.verbose("Initial State of Request Catcher URL:\n") 
    print(initial_state)  # Print the rendered HTML TODO: remove the print.



  #TODO: check SSRF attacks here.
  for payload in reader.read_wordlist("./wordlist/ssrf_payloads.txt"): #TODO: CHECK WHETHER THIS WORKING OR NOT.
      payload = payload.strip()

      try:
        if method in ['get']:
            pattern = re.compile(r'\?\w+=.*', re.IGNORECASE)
            matched = re.findall(pattern,endpoint) # Check if parameters present in the requests.
            
            if len(matched) != 0: 
               fuzz_url = f"{endpoint}&{payload}={catcher_url}/{generate_random_string(4)}"
            
            else:
              fuzz_url = f"{endpoint}?{payload}={catcher_url}/{generate_random_string(4)}"
            
            if verbose:
               color.verbose(f"Trying SSRF attack against URL: {fuzz_url}")
            
            r = requests.request(method, fuzz_url,headers=headers,timeout=timeout,verify=False)
               
               

        else: # put, post, delete
            if data != None:
               headers['Content-Type'] = 'application/x-www-form-urlencoded'
               fuzz_data = f"{data}&{payload}={catcher_url}/{generate_random_string(4)}"
               if verbose:
                  color.verbose(f"Trying SSRF attack with Data: {fuzz_data}")
               r = requests.request(method,endpoint,headers=headers,timeout=timeout,data=fuzz_data,verify=False)

            elif json != None:
               ori_json = copy.deepcopy(json)
               fuzz_json = json
               fuzz_json[f'{payload}'] = catcher_url + f"/{generate_random_string(4)}"
               
               if verbose:
                  color.verbose(f"Trying SSRF attack with JSON: {fuzz_json}")

               r = requests.request(method,endpoint,headers=headers,timeout=timeout,json=fuzz_json,verify=False)
               json = copy.deepcopy(ori_json)

                
            else: # Just treat it as normal post requests  
                headers['Content-Type'] = 'application/x-www-form-urlencoded'
                fuzz_data = f"{payload}={catcher_url}"
                if verbose:
                  color.verbose(f"Trying SSRF attack with Data: {fuzz_data}")
                r = requests.request(method,endpoint,headers=headers,timeout=timeout,data=fuzz_data,verify=False)


        #TODO: add progress bar, 429/503 checks etc.
        if r.status_code in [429,503]:
           color.warning("429/503 HTTP Codes detected, SSRF attack has been terminated.")
           break
        
        if monitor_changes(initial_state,driver,verbose,interval=3,attempts=1):
          
          if method in ['get']:
            color.red(f"API7:2023 - Server Side Request Forgery (SSRF): SSRF detected in {fuzz_url}")
            vulnerabilities.append(f"API7:2023 - Server Side Request Forgery (SSRF): SSRF detected in {fuzz_url}")
            
          else: #TODO: add some verbose messages.
              if data != None:
                color.red(f"API7:2023 - Server Side Request Forgery (SSRF): SSRF detected in {endpoint}.")
                color.red(f"HTTP Method: {method.upper()}")
                color.red(f"DATA: {data}")
                vulnerabilities.append(f"API7:2023 - Server Side Request Forgery (SSRF): SSRF detected in {endpoint}. HTTP Method: {method.upper()} DATA: {data} ")
             
              elif json != None:
                color.red(f"API7:2023 - Server Side Request Forgery (SSRF): SSRF detected in {endpoint}.")
                color.red(f"HTTP Method: {method.upper()}")
                color.red(f"JSON: {fuzz_json}")
                vulnerabilities.append(f"API7:2023 - Server Side Request Forgery (SSRF): SSRF detected in {endpoint}. HTTP Method: {method.upper()} JSON: {fuzz_json} ")
            
              else:
                color.red(f"API7:2023 - Server Side Request Forgery (SSRF): SSRF detected in {endpoint}.")
                color.red(f"HTTP Method: {method.upper()}")
                color.red(f"DATA: {fuzz_data}")
                vulnerabilities.append(f"API7:2023 - Server Side Request Forgery (SSRF): SSRF detected in {endpoint}. HTTP Method: {method.upper()} DATA: {fuzz_data} ")
            
          
          break


      except requests.ConnectTimeout:
        print(f"[HTTP Method]: {method.upper()} - Connection timed out - {endpoint}. Check the connection and try again.")
      


  driver.quit()
  if len(vulnerabilities) == 0:
     color.green(f"API7:2023 - Server Side Request Forgery (SSRF)")  



  return vulnerabilities









