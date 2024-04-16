import helpers.color_text as color
import helpers.file_reader as reader

def check_api_3(endpoint, method: str, headers: dict, timeout: float, verbose: bool, data: str = None, json: dict = None, response=None):
    color.banner("------------------------ API3:2023 - Broken Object Property Level Authorization ------------------------")

    vulnerabilities = []
    print("Attempt to find sensitive keywords in HTTP response.") 
    sensitive_keys = reader.read_wordlist('./wordlist/sensitive_keys.txt')

    for sensitive_key in sensitive_keys:
        if verbose:
            color.verbose(f"Searching the keyword \"{sensitive_key.strip()}\" in response.")

        index = response.text.lower().strip().find(sensitive_key.strip().lower())

        if index != -1:
            color.yellow(f"API3:2023 - Broken Object Property Level Authorization: Potential sensitive keyword \"{sensitive_key.strip()}\" detected in response content.")
            vulnerabilities.append(f"API3:2023 - Broken Object Property Level Authorization: Potential sensitive keyword \"{sensitive_key.strip()}\" detected in response content.")

    if len(vulnerabilities) == 0:
        color.green(f"API3:2023 - Broken Object Property Level Authorization")
    return vulnerabilities
