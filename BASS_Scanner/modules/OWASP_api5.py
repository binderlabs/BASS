#  API5:2023 - Broken Function Level Authorization
import helpers.color_text as color
import re
import requests
from urllib.parse import urlparse


def replace_and_strip(url):
    pattern = r'(/user/|/user$)'
    replacement = '/users/'
    replaced_url = re.sub(pattern, replacement, url)
    
    if "/users/" in replaced_url:
        stripped_url = replaced_url.split("/users/")[0] + "/users"
    else:
        stripped_url = replaced_url
    
    return stripped_url



def check_api_5(endpoint, method : str, headers: dict, timeout : float, verbose : bool, data : str = None, json : dict = None, response = None):
  color.banner("------------------------ API5:2023 - Broken Function Level Authorization ------------------------") 
  headers.update({"Content-Type": "application/json"})

  vulnerabilities = []
  print("Attempt to find /user/ keyword in the URL supplied.")
  parsed_url = urlparse(endpoint)
  pattern = r'/user/|/user$' # detect for user keyword in URL.
  matches = re.findall(pattern, parsed_url.path)
  if len(matches) != 0:
    print(f"Attempt to change {matches[0]} to /users/ in the URL to see if we can access all users data.")
    color.warning("Might be a false positive if the account under testing is an admin.")
    updated_path = replace_and_strip(parsed_url.path)

    if parsed_url.query != '':
      updated_endpoint = f"{parsed_url.scheme}://{parsed_url.netloc}{updated_path}" + f"?{parsed_url.query}"
      if verbose:
         color.verbose(f"Trying {updated_endpoint} to see if we can access all users data.")
    else:
      updated_endpoint = f"{parsed_url.scheme}://{parsed_url.netloc}{updated_path}"
      if verbose:
         color.verbose(f"Trying {updated_endpoint} to see if we can access all users data.")
    if data != None:
       headers['Content-Type'] = 'application/x-www-form-urlencoded'
    
    r = requests.request(method,updated_endpoint,headers=headers,data=data,json=json,timeout=timeout,verify=False)
    if len(r.text) != len(response.text) and r.status_code not in [403,404,500]: 
      color.yellow(f"API5:2023 - Broken Function Level Authorization: Potential all users data endpoint accessible in {updated_endpoint}. (Tentative)")
      vulnerabilities.append(f"API5:2023 - Broken Function Level Authorization: Potential all users data endpoint accessible in {updated_endpoint}. (Tentative)")

  if len(vulnerabilities) == 0:
    color.green(f"API5:2023 - Broken Function Level Authorization")
  return vulnerabilities
