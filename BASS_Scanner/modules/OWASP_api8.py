#  API8:2023 - Security Misconfiguration
import helpers.color_text as color
import requests

def check_api_8(endpoint, method : str, headers: dict, timeout : float, verbose : bool, data : str = None, json : dict = None, response = None):
  color.banner("------------------------ API8:2023 - Security Misconfiguration ------------------------") 
  vulnerabilities = []

  if response != None:
    response_headers = response.headers

    # Check for directory listing.
    # If 200 OK AND directory listing in response
    # Keyword: Directory listing for / 
    # Keyword 2: Index of / 
    if "Directory listing for /" in response.text or "Index of /" in response.text and response.status_code == 200:
        
      vulnerabilities.append(f'API8:2023 - Security Misconfiguration: Directory listing enabled in {endpoint}. Ensure that directory listing is disabled to prevent information disclosure.')
      color.red(f"API8:2023 - Security Misconfiguration: Directory listing enabled in {endpoint}. Ensure that directory listing is disabled to prevent information disclosure.")
     

    #TESTING FOR CORS.
    try:
      headers['Origin'] = 'null'
      cors_request = requests.request(method,endpoint,headers=headers,timeout=timeout,verify=False)
      if 'Access-Control-Allow-Origin' in cors_request.headers and cors_request.headers['Access-Control-Allow-Origin'] == 'null':
        vulnerabilities.append('API8:2023 - Security Misconfiguration: Access-Control-Allow-Origin allows null origin, consider restrict it to safe domains.')
        color.yellow('API8:2023 - Security Misconfiguration: Access-Control-Allow-Origin allows null origin, consider restrict it to safe domains.')
      

      headers['Origin'] = 'https://malicious-site.com'
      cors_request = requests.request(method,endpoint,headers=headers,timeout=timeout,verify=False)
      if 'Access-Control-Allow-Origin' in cors_request.headers and cors_request.headers['Access-Control-Allow-Origin'] == 'https://malicious-site.com':
        vulnerabilities.append('API8:2023 - Security Misconfiguration: Access-Control-Allow-Origin allows arbitrary origin, consider restrict it to safe domains.')
        color.yellow('API8:2023 - Security Misconfiguration: Access-Control-Allow-Origin allows arbitrary origin, consider restrict it to safe domains.')
      
      headers.pop('Origin') # Reset the origin header.


    except requests.ConnectTimeout: 
        print(f"[HTTP Method]: {method.upper()} - Connection timed out - {endpoint}. Check the connection and try again.") 
  
    
    if "Access-Control-Allow-Origin" in response_headers and response_headers['Access-Control-Allow-Origin'] == "*":
      vulnerabilities.append('API8:2023 - Security Misconfiguration: Access-Control-Allow-Origin allows any origin, consider restricted it to safe domains.')
      color.yellow('API8:2023 - Security Misconfiguration: Access-Control-Allow-Origin allows any origin, consider restricted it to safe domains.')
      

    if 'Strict-Transport-Security' not in response_headers:
      vulnerabilities.append('API8:2023 - Security Misconfiguration: Strict-Transport-Security header not found, consider adding it.')
      color.yellow('API8:2023 - Security Misconfiguration: Strict-Transport-Security header not found, consider adding it.')

    if 'X-Powered-By' in response_headers:
      vulnerabilities.append('API8:2023 - Security Misconfiguration: X-Powered-By header detected, consider removing it.')
      color.yellow('API8:2023 - Security Misconfiguration: X-Powered-By detected, consider removing it.')
      

    if 'Server' in response_headers:
      vulnerabilities.append('API8:2023 - Security Misconfiguration: Server header detected, consider removing it.')
      color.yellow('API8:2023 - Security Misconfiguration: Server header detected, consider removing it.')


    if 'Cache-Control' not in response_headers:
      vulnerabilities.append('API8:2023 - Security Misconfiguration: Cache-Control header not found, consider using it.')
      color.yellow('API8:2023 - Security Misconfiguration: Cache-Control header not found, consider using it.')

  if len(vulnerabilities) == 0:
    color.green(f"API8:2023 - Security Misconfiguration")  
  return vulnerabilities
