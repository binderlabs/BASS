#  API6:2023 - Unrestricted Access to Sensitive Business Flows
import requests
import helpers.color_text as color 


#@note Testing for broken access control by taking away token headers and see if we can gain unauthenticated access to the endpoint.
#@note Only check when users supply either Authorization/Cookie header(s).

def check_api_6(endpoint, method : str, headers: dict, timeout : float, verbose : bool, data : str = None, json : dict = None, response = None):
  color.banner("------------------------ API6:2023 - Unrestricted Access to Sensitive Business Flows ------------------------") 
  vulnerabilities = []

  try:
    original_authorization_header = None
    original_cookie_header = None

    if 'Authorization' in headers or 'Cookie' in headers:
      original_response_content_length = len(response.text)

      if 'Authorization' in headers:
        original_authorization_header = headers['Authorization']
        if verbose:
          color.verbose(f"Original Authorization header: {original_authorization_header}")
        del headers['Authorization']
        

      if data != None:
        headers['Content-Type'] = 'application/x-www-form-urlencoded'
      
      
      if 'Cookie' in headers:
        original_cookie_header = headers['Cookie']
        if verbose:
          color.verbose(f"Original Cookie header: {original_cookie_header}")
        del headers['Cookie']
      
      r = requests.request(method,endpoint,headers=headers,data=data,json=json,timeout=timeout,verify=False)
      if len(r.text) == original_response_content_length: 
        color.warning(f"Authorization/Cookie header(s) is not needed for {endpoint} endpoint, check whether if this is an restricted endpoint.")
        while True:
          answer = input("Is the endpoint restricted? y/n: ")
          if answer.lower() not in ['y','n']:
            color.warning("Invalid Input.")
            continue
          break
        if answer.lower() == 'y':
          vulnerabilities.append(f"API6:2023 - Unrestricted Access to Sensitive Business Flows: restricted endpoint {endpoint} can be accessed without Authorization/Cookie header(s).")
          color.red(f"API6:2023 - Unrestricted Access to Sensitive Business Flows: restricted endpoint {endpoint} can be accessed without Authorization/Cookie header(s).")

      
      #Reset the headers for the rest of the testing.
      if original_authorization_header != None:
        headers['Authorization'] = original_authorization_header

      if original_cookie_header != None:
        headers['Cookie'] = original_cookie_header

    else:
      color.warning("Skipping API6:2023 - Unrestricted Access to Sensitive Business Flows as Authorization/Cookie header(s) not found in the request.")

  

  
  except requests.ConnectTimeout: 
    return vulnerabilities
  
  if len(vulnerabilities) == 0:
    color.green(f"API6:2023 - Unrestricted Access to Sensitive Business Flows")
  return vulnerabilities
