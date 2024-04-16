import argparse
import requests
import sys
import datetime
import os
from modules import *
import json as JSON
import helpers.color_text as color
import helpers.custom_scan as custom_scan
from urllib.parse import urlparse

logo = """
 ____  _           _           _           _                  _____ _____  _____                                 
|  _ \(_)         | |         | |         | |           /\   |  __ \_   _|/ ____|                                
| |_) |_ _ __   __| | ___ _ __| |     __ _| |__  ___   /  \  | |__) || | | (___   ___ __ _ _ __  _ __   ___ _ __ 
|  _ <| | '_ \ / _` |/ _ \ '__| |    / _` | '_ \/ __| / /\ \ |  ___/ | |  \___ \ / __/ _` | '_ \| '_ \ / _ \ '__|
| |_) | | | | | (_| |  __/ |  | |___| (_| | |_) \__ \/ ____ \| |    _| |_ ____) | (_| (_| | | | | | | |  __/ |   
|____/|_|_| |_|\__,_|\___|_|  |______\__,_|_.__/|___/_/    \_\_|   |_____|_____/ \___\__,_|_| |_|_| |_|\___|_| 
"""


ignore_status_code = 0

def check_status_code(status_code):
    global ignore_status_code
    if status_code in [400,403,404,405,500,503] and ignore_status_code == 0:
        color.warning(f"Response status code is {status_code}")
        while True:
          answer = input("Continue? y/n: ")
          if answer.lower() not in ['y','n']:
            color.warning("Invalid Input.")
            continue
          break
        if answer.lower() == 'y':
            ignore_status_code = 1 
        else:
            print("BYE")
            exit(0)

def prepare_request(method : str, url : str, headers: dict, timeout : float, verbose : bool , scan_type: str, data : str = None, json : dict = None):
    try:
        parsed_url = urlparse(url)
        if not url.endswith('/') and parsed_url.query == '' and parsed_url.path == '':
            url = url + "/" #Add / if user didn't add at the back.
        if verbose:
            color.verbose(f"Start scanning on target: {url}")
        if method in ['get']:
            request = requests.request(method, url, headers=headers, timeout=timeout,verify=False) # Ignore SSL verification by default.
            check_status_code(request.status_code)
            return process_endpoints(url, method, headers, timeout, verbose,scan_type,response=request) 
            
            
                
        else: # post, put, delete
            if data != None:
                headers['Content-Type'] = 'application/x-www-form-urlencoded' 
                request = requests.request(method, url, headers=headers, timeout=timeout,data=data,verify=False)
                check_status_code(request.status_code)
                return process_endpoints(url, method, headers, timeout, verbose,scan_type,data=data,response=request) 
                

            elif json != None:
                try:
                    json_value = JSON.loads(json)
                except Exception as err:
                    print(f"Exception Caught:{err}")
                    print("Please provide the right format for JSON data. Example: -j/--json '{\"name\":\"BinderAPIScanner\",\"best\":true}'")
                    exit(-1)


                request = requests.request(method, url, headers=headers, timeout=timeout,json=json_value,verify=False) 
                check_status_code(request.status_code)
                return process_endpoints(url, method, headers, timeout, verbose, scan_type,json=json_value,response=request)
                
                
            else:
                request = requests.request(method, url, headers=headers, timeout=timeout,verify=False)
                check_status_code(request.status_code)
                return process_endpoints(url, method, headers, timeout, verbose,scan_type,response=request)
        
    
        
        
    

    except requests.ConnectTimeout:
        print(f"[HTTP Method]: {method.upper()} - Connection timed out - {url}. Check the connection and try again.") 


def process_endpoints(endpoint, method: str, headers: dict, timeout: float,  verbose : bool, scan_type: str, data : str = None, json : dict = None,response = None): # Up to this point, all endpoint should be considered valid here and ready to test for OWASP API top 10.
    vulnerabilities = []

    if scan_type == 'custom':
        options = custom_scan.choose_options()
        for option in options:
            vulnerabilities.extend(option(endpoint, method, headers, timeout, verbose, data, json,response))


    else:  #full scan
        for check_func in [OWASP_api1.check_api_1, OWASP_api2.check_api_2, OWASP_api3.check_api_3, OWASP_api4.check_api_4, OWASP_api5.check_api_5, OWASP_api6.check_api_6, OWASP_api7.check_api_7, OWASP_api8.check_api_8, OWASP_api9.check_api_9, OWASP_api10.check_api_10]:
            vulnerabilities.extend(check_func(endpoint, method, headers, timeout, verbose, data, json,response))
    
    return vulnerabilities 


def validate_method(value):
    methods = value.lower()

    if methods not in ['get','post','put','delete']: 
        raise argparse.ArgumentTypeError(f"argument -m/--method: invalid choice: '{methods}' (choose from 'GET', 'POST', 'PUT', 'DELETE')")
    return methods


def main():
  usage = "main -u URL [--data|--json] DATA/JSON --scan-type custom -o output.txt -v \n"
  epilog="""Examples:
       main.py -u http://127.0.0.1/api/user/1 -v (full scan)
       main.py -u http://127.0.0.1/api/user/1 --scan-type custom -v (custom scan)
       main.py -u http://127.0.0.1/api/user/1 -H 'Cookie: CookieGoesHere' -H 'Authorization: Bearer JWTGoesHere' -v (credentialed scan)
       main.py -u http://127.0.0.1/api/user/1 --data 'name=testing' -m POST -v
       main.py -u http://127.0.0.1/api/user/1 --json '{\"token\": TokenGoesHere}' -m PUT -v
"""

  parser = argparse.ArgumentParser(usage=usage,epilog=epilog,formatter_class=argparse.RawDescriptionHelpFormatter)
  
  if not len(sys.argv)>1:
    parser.print_help()
    exit()

  print(logo)
  group = parser.add_mutually_exclusive_group()
  parser.add_argument('-u','--url',dest="url",help="URL to check for OWASP API Top 10 risks. Example: -u 'https://www.test.com/api/user ",required=True)
  parser.add_argument('-H','--headers',dest="headers",action='append',help="Custom header(s) to add to the requests. Example: -H 'Cookie: TEST' -H 'Authorization: TEST' ")
  group.add_argument('-d','--data',dest="data",help="Custom payload(s) to add to the (post|put|delete) requests. Example: -d 'token=YourTokenGoesHere' ")
  group.add_argument('-j','--json',dest="json",help="Custom json(s) payload to add to the (post|put|delete) requests. Example: -j '{\"token\":\"YourTokenGoesHere\"}'")
  parser.add_argument('-m','--method',dest="method",type=validate_method,help="HTTP method(s) to use. Example: -m POST (default=\"GET\")",default="get")
  parser.add_argument('-t', '--timeout', dest="timeout", type=float, help='Specify the amount of seconds before a request times out. (default=\"5\")', default=5)
  parser.add_argument('--scan-type', dest='scan_type',type=str, choices=['full', 'custom'], help='Specify the type of scan to perform. Example: --scan-type \"custom\"',default='full')
  parser.add_argument('-v', '--verbose', action='store_true', help='Verbose mode')
  parser.add_argument("-o", "--output", type=str, default='', help="Output filename")
 
  args = parser.parse_args() 
  url = args.url
  headers : list = args.headers
  data : str = args.data
  json : str = args.json
  method : str = args.method
  timeout = args.timeout
  scan_type : str = args.scan_type
  verbose : bool = args.verbose 

  if data != None or json != None:
      if method == 'get':
          color.warning("DATA/JSON inputs detected, default to POST method.") 
          method = 'post'

  if method == 'delete':
      color.warning("Dangerous DELETE HTTP method detected, data might be deleted during the scanning.")
      while True:
          answer = input("Continue? y/n: ")
          if answer.lower() not in ['y','n']:
            color.warning("Invalid Input.")
            continue
          break
      if answer.lower() == 'n':
            print("BYE")
            exit(0)

  headers = {}

  if args.headers:
    for header in args.headers:
        key, value = header.split(':')
        headers[key.strip()] = value.strip()

    

  try:
    vulnerabilities = prepare_request(method, url, headers, timeout, verbose, scan_type, data, json) 

    if len(vulnerabilities) != 0:

        if args.output == '':
            path = "output"
            isExist = os.path.exists(path)
            if not isExist:
                os.makedirs(path)
            
            parsed_url = urlparse(url)
            args.output = f'output/{parsed_url.netloc}-{datetime.datetime.now()}.txt'

        with open(args.output, 'w') as file:
            for vulnerability in vulnerabilities:
                file.write(vulnerability)
            
            print(f"Successfully save the output to {args.output}.")



  except Exception as e:
      print(f"Something went wrong! Exception caught: {e}")


if __name__ == "__main__":
  main()