from termcolor import colored


def red(text: str, print_console: bool = True):
    colored_text = colored(f"[!] {text}",'red',attrs=['bold'])
    if print_console:
        print(colored_text)

    return colored_text


def yellow(text: str, print_console: bool = True):

    colored_text = colored(f"[!] {text}",'yellow',attrs=['bold'])
    if print_console:
        print(colored_text)

    return colored_text


def green(text: str, print_console: bool = True):
    colored_text = colored(f"[PASS] {text}",'green',attrs=['bold'])
    if print_console:
        print(colored_text)

    return colored_text



def light_yellow(text: str, print_console: bool = True):
    colored_text = colored(f"[!] {text}",'light_yellow',attrs=['bold'])
    if print_console:
        print(colored_text)

    return colored_text



def banner(text: str, print_console: bool = True):
    colored_text = colored(f"\n{text}\n",'magenta',attrs=['bold'])
    if print_console:
        print(colored_text)

    return colored_text

def light_red(text: str, print_console: bool = True):
    colored_text = colored(f"[!] {text}",'light_red',attrs=['bold'])
    if print_console:
        print(colored_text)

    return colored_text


def warning(text: str, print_console: bool = True):
    colored_text = colored(f"[WARNING] {text}",'light_blue',attrs=['bold'])
    if print_console:
        print(colored_text)

    return colored_text


def verbose(text: str, print_console: bool = True):
    verbose_text = (f"[VERBOSE] {text}")
    if print_console:
        print(verbose_text)

    return verbose_text

def skip(text: str, print_console: bool = True):
    skip_text = colored(f"[SKIPPED] {text}",'light_yellow',attrs=['bold'])
    if print_console:
        print(skip_text)

    return skip_text