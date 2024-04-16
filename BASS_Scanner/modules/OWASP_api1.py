# API1:2023 - Broken Object Level Authorization
import helpers.color_text as color
import random 
import string
from urllib.parse import urlparse
import requests
from collections import Counter
import helpers.file_reader as reader
import copy


def generate_random_digits(digit):
    # Ensure the length is at least 1 to avoid index errors
    if len(str(digit)) < 1:
        return ""

    # Generate the first digit (1-9) to ensure it's not zero
    first_digit = random.choice(string.digits[1:])
    
    # Generate the remaining digits, which can include zero
    # Adjusted range to digit-1 since we already have the first digit
    remaining_digits = ''.join(random.choice(string.digits) for i in range(len(str(digit)) - 1))
    
    # Combine the first non-zero digit with the remaining digits
    random_digits = first_digit + remaining_digits
    return random_digits


def check_api_1(endpoint, method : str, headers: dict, timeout : float, verbose : bool, data : str = None, json : dict = None, response = None):
  color.banner("------------------------ API1:2023 - Broken Object Level Authorization ------------------------") 
  vulnerabilities = []
  original_content_length = len(response.text)
  content_length_list = []
  request_list = []
  updated_endpoints = []
  parsed_url = urlparse(endpoint)
  print("Attempt to find IDs (Example: user id) in the endpoint supplied.")
  if parsed_url.path != '':
    values = parsed_url.path.split('/') # GET method
  
    for value in values: 
        
        if value.isdigit() and len(str(value)) <= 2:
           for i in range(1,100): # id: 1 to 99
              index = values.index(value)
              original_value = values[index]
              values[values.index(value)] = str(i)
              new_path = "/".join(values)
              #updated_path = parsed_url.path.replace(value,str(i))
              if parsed_url.query != '':
                 updated_endpoint = f"{parsed_url.scheme}://{parsed_url.netloc}{new_path}?{parsed_url.query}"
              else: 
                 updated_endpoint = f"{parsed_url.scheme}://{parsed_url.netloc}{new_path}"
              values[index] = original_value


              r = requests.request(method,updated_endpoint,headers=headers,data=data,json=json,timeout=timeout,verify=False)
              content_length_list.append(len(r.text))
              request_list.append(r)
              updated_endpoints.append(updated_endpoint)
              


        elif value.isdigit() and len(str(value)) <= 6: #If digits between 3 and 6, just try 100 attempts with random digits.
           for i in range(0,100): #info: change the value here to increase/decrease number of attempts.
              updated_path = parsed_url.path.replace(value,generate_random_digits(value))
              if parsed_url.query != '':
                 updated_endpoint = f"{parsed_url.scheme}://{parsed_url.netloc}{updated_path}?{parsed_url.query}"
              else: 
                 updated_endpoint = f"{parsed_url.scheme}://{parsed_url.netloc}{updated_path}"
              
              r = requests.request(method,updated_endpoint,headers=headers,data=data,json=json,timeout=timeout,verify=False)
              content_length_list.append(len(r.text))
              request_list.append(r)
              updated_endpoints.append(updated_endpoint)

    if len(content_length_list) != 0:
      counter = Counter(content_length_list)
      unique_content_length = [element for element, count in counter.items() if count == 1 or element == original_content_length] #@note here is based on the original content length. 
      for i in unique_content_length:
        for j in range(0,len(content_length_list)):
           if i == content_length_list[j]:
              if request_list[j].status_code in [403,404,500]:
                 continue
              
              if request_list[j].text == response.text: #Original response will be skipped.
                 continue
              vulnerabilities.append(f"API1:2023 - Broken Object Level Authorization: Potential endpoint(s) with different IDs discovered: {updated_endpoints[j]}. (Tentative)")
              color.warning("Might be a false positive if the account under testing is an admin.")
              color.yellow(f"API1:2023 - Broken Object Level Authorization: Potential endpoint(s) with different IDs discovered: {updated_endpoints[j]}. (Tentative)")

  if json != None:

    print("Attempt to find IDs (Example: user id) in the JSON field supplied.")
    keywords = reader.read_wordlist('./wordlist/id_keywords.txt') 
    for keyword in keywords:
       if json.get(keyword.strip()) != None:
         content_length_list = []
         request_list = [] 
         json_list = []
         orginal_json_value = copy.deepcopy(json)
         if str(json[keyword.strip()]).isdigit() and len(str(json[keyword.strip()])) <= 2:
            for i in range(1,100): # 1-99
              if type(json[keyword.strip()]) == str:
                json[keyword.strip()] = str(i)
              
              elif type(json[keyword.strip()]) == int:
                json[keyword.strip()] = int(i)

              r = requests.request(method,endpoint,headers=headers,data=data,json=json,timeout=timeout,verify=False)
              content_length_list.append(len(r.text))
              request_list.append(r)
              json_list.append(copy.deepcopy(json))

        
         elif str(json[keyword.strip()]).isdigit() and len(str(json[keyword.strip()])) <= 6:
            for i in range(0,100):
              random_digit = generate_random_digits(json[keyword.strip()])
              if type(json[keyword.strip()]) == str:
                json[keyword.strip()] = str(random_digit)
              elif type(json[keyword.strip()]) == int: 
                json[keyword.strip()] = int(random_digit)

              r = requests.request(method,endpoint,headers=headers,data=data,json=json,timeout=timeout,verify=False)
              content_length_list.append(len(r.text))
              request_list.append(r)
              json_list.append(copy.deepcopy(json))
         json = copy.deepcopy(orginal_json_value)


         if len(content_length_list) != 0:
          counter = Counter(content_length_list)
          unique_content_length = [element for element, count in counter.items() if count == 1 or element == original_content_length] #@note here is based on the original content length. 
          for i in unique_content_length:
             for j in range(0,len(content_length_list)):
              if i == content_length_list[j]:
                 if request_list[j].status_code in [403,404,500]:
                    continue
                 
                 if request_list[j].text == response.text: #Original response will be skipped.
                    continue
                 
                 vulnerabilities.append(f"API1:2023 - Broken Object Level Authorization: Potential endpoint(s) with different IDs discovered: {endpoint} with JSON: {json_list[j]}. (Tentative)")
                 color.warning("Might be a false positive if the account under testing is an admin.")
                 color.yellow(f"API1:2023 - Broken Object Level Authorization: Potential endpoint(s) with different IDs discovered: {endpoint} with JSON: {json_list[j]}. (Tentative)")


                 
     
    

  if data != None:
    print("Attempt to find IDs (Example: user id) in the DATA field supplied.")
    parameters = data.split("&")
    keywords = reader.read_wordlist('./wordlist/id_keywords.txt')
    for i in range(len(parameters)):
       key, value = parameters[i].split('=')
       for keyword in keywords:
         content_length_list = []
         request_list = []
         data_list = []
         if keyword.split() == key.split():
            if value.isdigit() and len(value) <=2:
               for j in range(1,100):
                  value = j
                  modified_value_param = f"{key}={value}"
                  modified_data_value = '&'.join(parameters[:i] + [modified_value_param] + parameters[i+1:])
                  r = requests.request(method,endpoint,headers=headers,data=modified_data_value,json=json,timeout=timeout,verify=False)
                  content_length_list.append(len(r.text))
                  request_list.append(r)
                  data_list.append(modified_data_value)
            

            elif value.isdigit() and len(value) <= 6:
               for j in range(0,100):
                  random_number = generate_random_digits(value)
                  value = random_number
                  modified_value_param = f"{key}={value}"
                  modified_data_value = '&'.join(parameters[:i] + [modified_value_param] + parameters[i+1:])
                  r = requests.request(method,endpoint,headers=headers,data=modified_data_value,json=json,timeout=timeout,verify=False)
                  content_length_list.append(len(r.text))
                  request_list.append(r)
                  data_list.append(modified_data_value)
            
            
            if len(content_length_list) != 0:
               counter = Counter(content_length_list)
               unique_content_length = [element for element, count in counter.items() if count == 1 or element == original_content_length] #@note here is based on the original content length. 
               for i in unique_content_length:
                  for j in range(0,len(content_length_list)):
                     if i == content_length_list[j]:
                        if request_list[j].status_code in [403,404,500]:
                           continue
                        if request_list[j].text == response.text: #Original response will be skipped.
                           continue
                 
                        vulnerabilities.append(f"API1:2023 - Broken Object Level Authorization: Potential endpoint(s) with different IDs discovered: {endpoint} with DATA: {data_list[j]}. (Tentative)")
                        color.warning("Might be a false positive if the account under testing is an admin.")
                        color.yellow(f"API1:2023 - Broken Object Level Authorization: Potential endpoint(s) with different IDs discovered: {endpoint} with DATA: {data_list[j]}. (Tentative)")
                        


  if len(vulnerabilities) == 0:
    color.green(f"API1:2023 - Broken Object Level Authorization")
  return vulnerabilities
