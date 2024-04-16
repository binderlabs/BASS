import helpers.color_text as color
import requests
from alive_progress import alive_bar
import helpers.file_reader as reader



def check_login_success(response_text, success_message):
  if success_message.strip() in response_text.strip():
     return True
  
  else:
     return False



def prompt(prompt_message):
    while True:
        user_input = input(prompt_message)
        if user_input:
            return user_input
        else:
            return None
        


def check_api_2(endpoint, method : str, headers: dict, timeout : float, verbose : bool, data : str = None, json : dict = None, response = None):
  color.banner("------------------------ API2:2023 - Broken Authentication ------------------------") 
  vulnerabilities = []
  CRACKED = False
  count = 0
  print("Attempt to bruteforce auth endpoint.")


  if json != None:
    if json.get('password') != None:
      print("Found password keyword in the JSON field attached.")
      while True:
          answer = input("Perform brute force attack on password field? y/n: ")
          if answer.lower() not in ['y','n']:
            color.warning("Invalid Input.")
            continue
          break
      if answer.lower() == 'n':
        color.skip(f"API2:2023 - Broken Authentication")
        return vulnerabilities

      password_supplied = json['password']
      if verbose:
        color.verbose(f"Original Password Supplied: {password_supplied}")
      passwords = reader.read_wordlist('./wordlist/passwords.txt')
      attempts = len(passwords)
      print("Attempt to bruteforce auth endpoint with commonly used passwords.")

      login_success_message = reader.read_wordlist('./wordlist/login_success_message.txt')
      user_supplied_login_success_message = prompt("Enter success login keyword if any (or press Enter to use the default wordlist): ")
      if user_supplied_login_success_message:
         if verbose:
            color.verbose(f"Login Success Message Supplied: {user_supplied_login_success_message}")
         login_success_message = login_success_message[:1]  # Delete all elements except first and overrides the first element.
         login_success_message[0] = user_supplied_login_success_message  

      with alive_bar(attempts) as bar:
        for password in passwords:
          json['password'] = password.strip()
          r = requests.request(method,endpoint,headers=headers,data=data,json=json,timeout=timeout,verify=False)
          
          if r.status_code in [429,503]: # 429 Too Many Requests, 503 Service Unavailable
            bar(attempts - count)
            break

          for success_message in login_success_message:
            if check_login_success(r.text,success_message) and r.status_code not in [400,401,403,404,500]:
                correct_password = password
                CRACKED = True
                break
          

          
          if CRACKED:
            bar(attempts - count)
            break
          
          count += 1
          bar()

      if CRACKED:
         
         color.red(f"API2:2023 - Broken Authentication: Weak password cracked in {endpoint}.")
         color.red(f"HTTP Method: {method.upper()}")
         color.red(f"Cracked the correct password! The password is: {correct_password.strip()}")

         vulnerabilities.append(f"API2:2023 - Broken Authentication: Weak password \"{correct_password.strip()}\" cracked in {endpoint}.")

      elif count > 0:
         color.warning("Test completed without cracking any commonly used passwords.")

      if r.status_code in [429,503]:
         color.warning("429/503 HTTP Codes detected,the brute force has been terminated.")  
          
      

  if len(vulnerabilities) == 0:
      color.green(f"API2:2023 - Broken Authentication")
  return vulnerabilities
