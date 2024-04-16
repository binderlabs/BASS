# API9:2023 - Improper Inventory Management
import time
import requests
import re
from collections import Counter
import helpers.color_text as color


def check_api_9(endpoint, method : str, headers: dict, timeout : float, verbose : bool, data : str = None, json : dict = None, response = None):
  color.banner("------------------------ API9:2023 - Improper Inventory Management ------------------------")
  vulnerabilities = []
  print("Attempt to find deprecated version of API endpoint given.")
  # v1 -> v2 , v2 -> v1 v[0-9]

  try:
    pattern = r"/v[0-9]+\//*"

    matches = re.findall(pattern, endpoint)
  
    if len(matches) != 0:
      print("Detected API endpoint attached contains version.")
    # we need to know the original content length first.
      original_content_length = len(response.text) 

      content_length_list = []
      requests_list = []

      for i in range(1,10):
        updated_endpoint = re.sub(pattern, f"/v{i}/", endpoint)
        if method in ['get']:
          deprecated_api_request = requests.request(method,updated_endpoint,headers=headers,timeout=timeout,verify=False) 
      
        else: # put, delete, post
          if data != None:
            headers['Content-Type'] = 'application/x-www-form-urlencoded'
          
          deprecated_api_request = requests.request(method,updated_endpoint,headers=headers,timeout=timeout,data=data,json=json,verify=False) 

      
        content_length_list.append(len(deprecated_api_request.text))
        requests_list.append(deprecated_api_request)

        if verbose and deprecated_api_request.status_code not in [403,404,500]:
          color.verbose(f"Received status code of {deprecated_api_request.status_code} from endpoint {updated_endpoint}.")


        if deprecated_api_request.status_code in [403,404,500]:
          color.warning(f"Received status code of {deprecated_api_request.status_code} from endpoint {updated_endpoint}.")


      counter = Counter(content_length_list)
      unique_content_length = [element for element, count in counter.items() if count == 1 or element == original_content_length] #@note here is based on the original content length. 
      if unique_content_length: # We only find unique content length and disregard content length that are duplicate.
        for i in range(len(unique_content_length)):
          index = content_length_list.index(unique_content_length[i])
          vulnerable_endpoint = re.sub(pattern, f"/v{index+1}/", endpoint) # +1 here because i starts at 1 on the above for loop.
        
          
          
          if requests_list[index].status_code in [403,404,500]:
            continue

          if vulnerable_endpoint == endpoint:
            continue

          vulnerabilities.append(f"API9:2023 - Improper Inventory Management: Potential other/deprecated version of endpoint(s) discovered: {vulnerable_endpoint}. (Tentative)")
          color.yellow(f"API9:2023 - Improper Inventory Management: Potential other/deprecated version of endpoint(s) discovered: {vulnerable_endpoint}. (Tentative)")
          if verbose:
            color.verbose(f"HTTP Response:\nResponse Status Code: {requests_list[index].status_code}\n")
            for header,value in requests_list[index].headers.items():
              print(f"{header.strip()}: {value.strip()}")
            print("")
            print(requests_list[index].text)
    

    

#TODO: add rate limit issue
  except requests.ConnectTimeout:
    return vulnerabilities 

  if len(vulnerabilities) == 0:
    color.green(f"API9:2023 - Improper Inventory Management")

  return vulnerabilities
