
#TODO: implement this function later.
def process_response(request, match_string, default_testing_length, verbose):

 

    response = request.text
    if match_string is not None:
        for string in match_string:
            if string in response:
                print(f"[+] {request.request.method} - \"{str(string)}\" detected: {request.request.url}")

    if len(response) != default_testing_length:
        print(f"[+] {request.request.method} - Different response length: {str(len(response))} - {request.request.url} ")
    if verbose:
        print(f"[VERBOSE] {request.request.method} {str(len(response))}       {request.request.url}")

