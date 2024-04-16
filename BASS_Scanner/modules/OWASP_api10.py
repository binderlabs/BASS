# API10:2023 - Unsafe Consumption of APIs
import re
import helpers.color_text as color
import requests
from collections import Counter
import helpers.file_reader as reader
from urllib.parse import urlparse

vulnerabilities = []

def sql_injection_detector(response):
  TENTATIVE_SQL_INJECTION_FOUND = 0
  SQL_INJECTION_FOUND = False
  for sql_message in reader.read_wordlist('./wordlist/sql_error_messages.txt'): #FUTHER IMPROVEMENT: add more wordlist inside.
    index = response.text.lower().strip().find(sql_message.strip().lower())
    if index != -1: #Matched
      color.yellow(f"Found '{sql_message.strip().lower()}' keyword in the HTTP response with HTTP Status Code of {response.status_code}.")
      TENTATIVE_SQL_INJECTION_FOUND += 1
      for sql_command in reader.read_wordlist('./wordlist/sql_commands_list.txt'):
        if sql_command.strip() in response.text:
          color.red(f"Found '{sql_command.strip()}' SQL command keyword in the HTTP response with HTTP Status Code of {response.status_code}.")
          SQL_INJECTION_FOUND = True
          break # just need to find 1 occurance.
      if SQL_INJECTION_FOUND:
          break
  return SQL_INJECTION_FOUND,TENTATIVE_SQL_INJECTION_FOUND
      
def add_quotes_to_params(parameters):
  params_to_test = []
  for i in range(len(parameters)):
          # For each parameter, split into key and value
          key, value = parameters[i].split('=')

          # First iteration adds '"` to the key
          modified_key_param = f"{key}'\"`={value}"
          modified_data_key = '&'.join(parameters[:i] + [modified_key_param] + parameters[i+1:])
          #print(modified_data_key)
          params_to_test.append(modified_data_key)
      
          # Second iteration adds '"` to the value
          modified_value_param = f"{key}={value}'\"`"
          modified_data_value = '&'.join(parameters[:i] + [modified_value_param] + parameters[i+1:])
          params_to_test.append(modified_data_value)
  return params_to_test
          

def add_quotes_to_json(data):
    results = []

    # Process each key and value pair
    for key in list(data.keys()):
        new_data = data.copy()
        new_data[key + "'\"`"] = new_data.pop(key)
        results.append(new_data)

        # Reset for value modification
        new_data = data.copy()
        if new_data[key] == None:
          new_data[key] = f"'\"`" #Handler null values.

        elif isinstance(new_data[key], int):
          new_data[key] = f"{new_data[key]}'\"`"
        
        elif isinstance(new_data[key], dict) or isinstance(new_data[key], list): # Nested dict in json not supported currently.
          continue

        else:
            new_data[key] = new_data[key] + "'\"`"
        results.append(new_data)

    return results


def inject_url(endpoint,method,headers,timeout,verbose: bool,data : str = None, json : dict = None):
  parsed_url = urlparse(endpoint)
  if parsed_url.query != '':
    parameters = parsed_url.query.split("&")
    params_to_test = add_quotes_to_params(parameters)
    
    for i in range(len(params_to_test)):
      injected_endpoint = f"{parsed_url.scheme}://{parsed_url.netloc}{parsed_url.path}" + f"?{params_to_test[i]}"
      if verbose:
        color.verbose(f"Injected Endpoint: {injected_endpoint}")
      SQL_INJECTION_FOUND,TENTATIVE_SQL_INJECTION_FOUND,endpoint  = inject_params(injected_endpoint,method,headers,timeout,verbose,data=data,json=json)

      if TENTATIVE_SQL_INJECTION_FOUND != 0:
         if SQL_INJECTION_FOUND:
          color.red(f"API10:2023 - Unsafe Consumption of APIs: Potential SQL Injection Discovered in {injected_endpoint} with: \nMethod: {method.upper()}")
          vulnerabilities.append(f"API10:2023 - Unsafe Consumption of APIs: Potential SQL Injection Discovered in {endpoint} with: \nMethod: {method.upper()}")
         else:
          vulnerabilities.append(f"API10:2023 - Unsafe Consumption of APIs: Potential SQL Injection Discovered in {endpoint} with: \nMethod: {method.upper()} (Tentative)")
          color.yellow(f"API10:2023 - Unsafe Consumption of APIs: Potential SQL Injection Discovered in {endpoint} with: \nMethod: {method.upper()} (Tentative)")

  else:
    injected_url = f"{endpoint}'\"`"
    if verbose:
      color.verbose(f"Injected Endpoint: {injected_url}")
    r = requests.request(method, injected_url,headers=headers,timeout=timeout,data=data,json=json,verify=False)
    SQL_INJECTION_FOUND, TENTATIVE_SQL_INJECTION_FOUND = sql_injection_detector(r)
    if TENTATIVE_SQL_INJECTION_FOUND != 0:
        if SQL_INJECTION_FOUND:
          color.red(f"API10:2023 - Unsafe Consumption of APIs: Potential SQL Injection Discovered in {injected_url} with: \nMethod: {method.upper()}")
          vulnerabilities.append(f"API10:2023 - Unsafe Consumption of APIs: Potential SQL Injection Discovered in {injected_url} with: \nMethod: {method.upper()}")
        else:
          color.yellow(f"API10:2023 - Unsafe Consumption of APIs: Potential SQL Injection Discovered in {injected_url} with: \nMethod: {method.upper()} (Tentative)")
          vulnerabilities.append(f"API10:2023 - Unsafe Consumption of APIs: Potential SQL Injection Discovered in {injected_url} with: \nMethod: {method.upper()} (Tentative)")



def inject_params(endpoint,method,headers,timeout,verbose: bool, data :str = None, json : dict = None):
  if data != None: 
    headers['Content-Type'] = 'application/x-www-form-urlencoded'
    r = requests.request(method, endpoint,headers=headers,timeout=timeout,data=data,verify=False) 
  
    SQL_INJECTION_FOUND, TENTATIVE_SQL_INJECTION_FOUND = sql_injection_detector(r)

  elif json != None:
    headers['Content-Type'] = 'application/json'
    r = requests.request(method, endpoint,headers=headers,timeout=timeout,json=json,verify=False)

    SQL_INJECTION_FOUND, TENTATIVE_SQL_INJECTION_FOUND = sql_injection_detector(r)


  else: #treat as normal post requests and nothing to inject in the params.
    SQL_INJECTION_FOUND = False
    TENTATIVE_SQL_INJECTION_FOUND = 0
  
  return SQL_INJECTION_FOUND,TENTATIVE_SQL_INJECTION_FOUND, endpoint
  




def check_api_10(endpoint, method : str, headers: dict, timeout : float, verbose : bool, data : str = None, json : dict = None, response = None):
  color.banner("------------------------ API10:2023 - Unsafe Consumption of APIs ------------------------")
  
  


  # 1. Host header injection. 
  headers['Host'] = 'mycustomurlforhostheaderinjection.com'
  print("Attempt to perform host header injection attacks.")
  try:
    if verbose:
      color.verbose(f"Injection Host header with value mycustomurlforhostheaderinjection.com.")
    host_header_injection_request = requests.request(method,endpoint,headers=headers,timeout=timeout,allow_redirects=False,verify=False)
    
    if 'mycustomurlforhostheaderinjection.com' in host_header_injection_request.text and host_header_injection_request.status_code in [301,302,303,307,308]: # Redirection HTTP codes.
      vulnerabilities.append('API10:2023 - Unsafe Consumption of APIs: Host header injection possible.')
      color.yellow('API10:2023 - Unsafe Consumption of APIs: Host header injection possible.')
  
    # Unset malicious host header
    del headers['Host']

  
   
    # 2. Attempt to access restricted /admin/ path by swapping /user/ -> /admin/.
    
    pattern = r"/user[s]*[\/]*/*"
    matches = re.findall(pattern, endpoint)
    if len(matches) != 0:
        print(f"Attempt to change {matches[0]} to /admin/ to see if we can access restricted endpoints.")
        color.warning("Might be a false positive if the account under testing is an admin.")
        updated_endpoint = re.sub(pattern, f"/admin/", endpoint)
        if data != None:
          headers['Content-Type'] = 'application/x-www-form-urlencoded'
        
        restricted_endpoint_request = requests.request(method,updated_endpoint,headers=headers,data=data,json=json,timeout=timeout,verify=False)
        if len(restricted_endpoint_request.text) != len(response.text) and restricted_endpoint_request.status_code not in [401,403,404,500]: 
          color.yellow(f"API10:2023 - Unsafe Consumption of APIs: Potential restricted admin endpoint(s) which are accessible by unauthenticated/low privilege users: {updated_endpoint}. (Tentative)")
          vulnerabilities.append(f"API10:2023 - Unsafe Consumption of APIs: Potential restricted admin endpoint(s) which are accessible by unauthenticated/low privilege users: {updated_endpoint}. (Tentative)")


    # 3. Attempt to inject '"` strings to cause SQL error messages. If red message means high confident, if yellow means tentative.
    print("Attempt to inject quotes in the URL and parameters to find SQL injection vulnerabilities.")
    if method in ['get']:
      inject_url(endpoint,method,headers,timeout,verbose)
        

    else: # put, delete, post

      # First, inject in URL just like GET request.
      inject_url(endpoint,method,headers,timeout,verbose,data=data,json=json)

      if data != None:
        # Split the string into parameters
        parameters = data.split('&')

        # Iterate over each parameter's index
        params_to_test = add_quotes_to_params(parameters)
          
        for i in range(len(params_to_test)):
          if verbose:
            color.verbose(f"Injected Data: {params_to_test[i]}")
          SQL_INJECTION_FOUND,TENTATIVE_SQL_INJECTION_FOUND,endpoint  = inject_params(endpoint,method,headers,timeout,verbose,data=params_to_test[i])

          if TENTATIVE_SQL_INJECTION_FOUND != 0:
            if SQL_INJECTION_FOUND:
              color.red(f"API10:2023 - Unsafe Consumption of APIs: Potential SQL Injection Discovered in {endpoint} with: \nMethod: {method.upper()} \nData: {params_to_test[i]}")
              vulnerabilities.append(f"API10:2023 - Unsafe Consumption of APIs: Potential SQL Injection Discovered in {endpoint} with: \nMethod: {method.upper()} \nData: {params_to_test[i]}")
            else:
              vulnerabilities.append(f"API10:2023 - Unsafe Consumption of APIs: Potential SQL Injection Discovered in {endpoint} with: \nMethod: {method.upper()} \nData: {params_to_test[i]} (Tentative)")
              color.yellow(f"API10:2023 - Unsafe Consumption of APIs: Potential SQL Injection Discovered in {endpoint} with: \nMethod: {method.upper()} \nData: {params_to_test[i]} (Tentative)")


      elif json != None:
        jsons_to_test = add_quotes_to_json(json)

        for json_to_test in jsons_to_test:
          if verbose:
            color.verbose(f"Injected JSON: {json_to_test}")
          SQL_INJECTION_FOUND,TENTATIVE_SQL_INJECTION_FOUND,endpoint  = inject_params(endpoint,method,headers,timeout,verbose,json=json_to_test)

          if TENTATIVE_SQL_INJECTION_FOUND != 0:
            if SQL_INJECTION_FOUND:
              vulnerabilities.append(f"API10:2023 - Unsafe Consumption of APIs: Potential SQL Injection Discovered in {endpoint} with: \nMethod: {method.upper()} \nData: {json_to_test}")
              color.red(f"API10:2023 - Unsafe Consumption of APIs: Potential SQL Injection Discovered in {endpoint} with: \nMethod: {method.upper()} \nData: {json_to_test}")
            else:
              vulnerabilities.append(f"API10:2023 - Unsafe Consumption of APIs: Potential SQL Injection Discovered in {endpoint} with: \nMethod: {method.upper()} \nData: {json_to_test} (Tentative)")
              color.yellow(f"API10:2023 - Unsafe Consumption of APIs: Potential SQL Injection Discovered in {endpoint} with: \nMethod: {method.upper()} \nData: {json_to_test} (Tentative)")


      

      else: # Just treat it as normal post requests, nothing to inject.
        SQL_INJECTION_FOUND = False
        TENTATIVE_SQL_INJECTION_FOUND = 0
        
        

  except requests.ConnectTimeout: 
    return vulnerabilities  

  if len(vulnerabilities) == 0:
    color.green(f"API10:2023 - Unsafe Consumption of APIs")
  return vulnerabilities
