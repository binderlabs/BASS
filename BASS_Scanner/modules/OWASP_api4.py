# API4:2023 - Unrestricted Resource Consumption
import time
import re
import requests
import helpers.file_reader as reader
import helpers.color_text as color
from alive_progress import alive_bar


def check_otp_success(response): 
  for success_message in reader.read_wordlist('./wordlist/otp_success_message.txt'):
    if success_message.strip() in response.text.strip():
      return True
    


def print_success_message(endpoint, method, correct_otp, verbose,response):
  color.red(f"API4:2023 - Unrestricted Resource Consumption: OTP has been cracked. \nEndpoint: {endpoint} \nHTTP Method: {method.upper()} \nOTP: {correct_otp}")
  if verbose:
    color.verbose(f"Cracked OTP HTTP Response: \nResponse Status Code: {response.status_code}")
    for header,value in response.headers.items():
      print(f"{header.strip()}: {value.strip()}")
    print("")
    print(response.text)


def check_otp_length_within_range(original_otp_code,verbose):
  no_of_digits = len(str(original_otp_code))
  iteration = 0
  if no_of_digits <= 6 and no_of_digits != 0: # Will try all combination, might take a long time if number of digits exceed 6.
    iteration = "9" * no_of_digits
    print("Trying to bruteforce the correct OTP...\n")
    if verbose:
      color.verbose(f"Iteration to try: {iteration}")

  if int(iteration) == 0:
    color.warning("Skipping API4:2023 - Unrestricted Resource Consumption as OTP found in the request is not within the range (1 to 6 digits).")
  
  return no_of_digits,int(iteration)



def check_api_4(endpoint, method : str, headers: dict, timeout : float, verbose : bool, data : str = None, json : dict = None, response = None):
  color.banner("------------------------ API4:2023 - Unrestricted Resource Consumption ------------------------") 
  vulnerabilities = [] 
  try:
    CRACKED = False
    pattern = re.compile(r'otp=[0-9]+', re.IGNORECASE) #FUTURE IMPROVEMENT: Add more wordlist other than the keyword otp.
    matched = re.findall(pattern,endpoint) # Find OTP keyword in URL.
    print("Attempt to find otp keyword in the endpoint supplied.")

    if len(matched) != 0: # MATCHED
       print("Found OTP keyword in the URL.")
    
       for i in range(len(matched)): 
           _ , original_otp_code = matched[i].split("=")
           if verbose:
             color.verbose(f"Original OTP Supplied: {original_otp_code}") 
          
           no_of_digits,iteration = check_otp_length_within_range(original_otp_code,verbose)
           

           if iteration > 0:
            number_of_elements = int(iteration) + 1 

            with alive_bar(number_of_elements) as bar:
              for j in range(0,int(iteration) + 1): # + 1 so that last number will be included.
                
                  
                otp_to_try = str(j).zfill(no_of_digits)
                updated_endpoint = endpoint.replace(matched[i],matched[i].split("=")[0] + "="+ otp_to_try) 
                
                if data != None:
                  headers['Content-Type'] = 'application/x-www-form-urlencoded'

                r = requests.request(method,updated_endpoint,headers=headers,data=data,json=json,timeout=timeout,verify=False)
              
                if r.status_code in [429,503]: # 429 Too Many Requests, 503 Service Unavailable
                  bar(number_of_elements - j)
                  break
                
                if check_otp_success(r):
                  CRACKED = True
                  bar(number_of_elements - j)
                  break

                bar()

            if CRACKED:
                print("")
                print_success_message(updated_endpoint,method,otp_to_try,verbose,r)
                vulnerabilities.append(f"API4:2023 - Unrestricted Resource Consumption: OTP has been cracked. \nEndpoint: {updated_endpoint} \nHTTP Method: {method.upper()} \nOTP: {otp_to_try}")
                CRACKED = False #Reset the variable for the rest of the tests below.
            
            else:
              color.warning("OTP not found.")

            if r.status_code in [429,503]:
              color.warning("429/503 HTTP Codes detected,the brute force has been terminated.")  
          
            
           
    
    if method in ['post','delete','put']: # REGEX data/json fields for OTP keyword
      print("Attempt to find otp keyword in the DATA/JSON field supplied.")
      if data != None:
        headers['Content-Type'] = 'application/x-www-form-urlencoded'
        matched = re.findall(pattern,data)
        if len(matched) != 0:
          print("Found OTP keyword in the DATA field attached.")
          for i in range(len(matched)):
            _ , original_otp_code = matched[i].split("=")
            if verbose:
              color.verbose(f"Original OTP Supplied: {original_otp_code}") 

          no_of_digits, iteration = check_otp_length_within_range(original_otp_code,verbose)
          if iteration > 0:
            number_of_elements = int(iteration) + 1

            with alive_bar(number_of_elements) as bar:
              for j in range(0,int(iteration) + 1): 
                otp_to_try = str(j).zfill(no_of_digits)
                updated_data = data.replace(matched[i],matched[i].split("=")[0] + "="+ otp_to_try) 
                r = requests.request(method,endpoint,headers=headers,timeout=timeout,data=updated_data,verify=False)
                
                if r.status_code in [429,503]: # 429 Too Many Requests, 503 Service Unavailable
                  bar(number_of_elements - j)
                  break

                if check_otp_success(r):
                  CRACKED = True
                  bar(number_of_elements - j)
                  break
                
                bar()
            
            if CRACKED:
              print("")
              print_success_message(endpoint,method,otp_to_try,verbose,r)
              vulnerabilities.append(f"API4:2023 - Unrestricted Resource Consumption: OTP has been cracked. \nEndpoint: {endpoint} \nHTTP Method: {method.upper()} \nOTP: {otp_to_try}")
              CRACKED = False

            else:
              color.warning("OTP not found.")

            if r.status_code in [429,503]:
              color.warning("429/503 HTTP Codes detected,the brute force has been terminated.")  
            
            
              

      
      elif json != None:
        headers['Content-Type'] = 'application/json'
        

        if json.get('otp') != None or json.get('OTP') != None:
          print("Found OTP keyword in the JSON field attached.")
          if json.get('otp') != None:
            original_otp_code = json['otp']
          else:
            original_otp_code = json['OTP']
          if verbose:
            color.verbose(f"Original OTP Supplied: {original_otp_code}")

          no_of_digits,iteration = check_otp_length_within_range(original_otp_code,verbose)
          
          if iteration > 0:
            number_of_elements = int(iteration) + 1 
            with alive_bar(number_of_elements) as bar:
              for j in range(0,number_of_elements): 
                otp_to_try = str(j).zfill(no_of_digits)

                if json.get('otp') != None: 
                  if type(json['otp']) == str:
                    json['otp'] = otp_to_try

                  elif type(json['otp']) == int:
                    json['otp'] = int(otp_to_try)
                
                else:
                  if type(json['OTP']) == str:
                    json['OTP'] = otp_to_try

                  elif type(json['OTP']) == int: #@note if the digits contains zero in the front, it will be removed.
                    json['OTP'] = int(otp_to_try)


                
                r = requests.request(method,endpoint,headers=headers,timeout=timeout,json=json,verify=False)
                if r.status_code in [429,503]: # 429 Too Many Requests, 503 Service Unavailable
                  bar(number_of_elements - j)
                  break

                if check_otp_success(r):
                  CRACKED = True
                  bar(number_of_elements - j)
                  break
                bar()
              
            if CRACKED:
              print("")
              print_success_message(endpoint,method,otp_to_try,verbose,r)
              vulnerabilities.append(f"API4:2023 - Unrestricted Resource Consumption: OTP has been cracked. \nEndpoint: {endpoint} \nHTTP Method: {method.upper()} \nOTP: {otp_to_try}")
              CRACKED = False
            
            else:
              color.warning("OTP not found.")
            if r.status_code in [429,503]:
             color.warning("429/503 HTTP Codes detected,the brute force has been terminated.")  
          

  
  except Exception as err:
    if verbose:
      print("Exception caught: ", err) 
    return vulnerabilities 
  
  if len(vulnerabilities) == 0:
    color.green(f"API4:2023 - Unrestricted Resource Consumption")
  return vulnerabilities
