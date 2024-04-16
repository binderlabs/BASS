import helpers.color_text as color
from modules import *


def choose_options():
    choices = []
    scans = []
    print("------------------------ BinderAPIScanner ------------------------")
    print("1.   API1:2023 - Broken Object Level Authorization")
    print("2.   API2:2023 - Broken Authentication (Note: Consists of brute force attack)")
    print("3.   API3:2023 - Broken Object Property Level Authorization")
    print("4.   API4:2023 - Unrestricted Resource Consumption (Note: Consists of brute force attack)")
    print("5.   API5:2023 - Broken Function Level Authorization")
    print("6.   API6:2023 - Unrestricted Access to Sensitive Business Flows")
    print("7.   API7:2023 - Server Side Request Forgery (SSRF) (Note: Consists of brute force attack)")
    print("8.   API8:2023 - Security Misconfiguration")
    print("9.   API9:2023 - Improper Inventory Management")
    print("10. API10:2023 - Unsafe Consumption of APIs")
    while True:
        answer = input("Choose your option(s) from [1-10] or type q/Q to continue: ")
        
        if answer.lower() not in ['1','2','3','4','5','6','7','8','9','10','q','Q']:
            color.warning("Invalid Input.")
            continue

        if answer.lower() == 'q':
            if len(choices) == 0:
                print("BYE")
                exit(0)
            else:
                if 1 in choices:
                    scans.append(OWASP_api1.check_api_1)
                
                if 2 in choices:
                    scans.append(OWASP_api2.check_api_2)

                if 3 in choices:
                    scans.append(OWASP_api3.check_api_3)
                
                if 4 in choices:
                    scans.append(OWASP_api4.check_api_4)
                
                if 5 in choices:
                    scans.append(OWASP_api5.check_api_5)
                
                if 6 in choices:
                    scans.append(OWASP_api6.check_api_6)
                
                if 7 in choices:
                    scans.append(OWASP_api7.check_api_7)
                
                if 8 in choices:
                    scans.append(OWASP_api8.check_api_8)
                
                if 9 in choices:
                    scans.append(OWASP_api9.check_api_9)
                
                if 10 in choices:
                    scans.append(OWASP_api10.check_api_10)

                return scans

        if int(answer) not in choices: # Q/q won't reach this line
            choices.append(int(answer))
            print(f"Your Choice(s): {sorted(choices)}")

        elif int(answer) in choices:
            while True:
                remove = input(f"Do you want to deselect option {answer}? y/n: ")
                if remove.lower() not in ['y','n']:
                    color.warning("Invalid Input.")
                    continue

                if remove.lower() == 'y':
                    choices.remove(int(answer))
                
                print(f"Your Choice(s): {sorted(choices)}")
                break
