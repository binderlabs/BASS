def read_wordlist(file:str):
    try:
        with open(file) as f:
            payloads = f.readlines()
    except Exception as err:
        print(err)
    return payloads