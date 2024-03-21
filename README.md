# Binderlabs API Security Simulator (BASS-Env)

Binderlabs API Security Simulator (BASS-Env) is a vulnerable API environment that is susceptible to the OWASP Top 10 API Security Risk – 2023. The environment was deliberately designed with API flaws and as a practice ground for cybersecurity professionals who wishes to hands-on their API hacking skills and enhance their knowledge in API Security testing domain.


## Install

- PHP 
- Mysql
- Postman Client
  
```
git clone https://github.com/binderlabs/BASS.git
```

Login into mysql and create db name "bass"

Import mysql database
```
cd BASS/database
mysql -u [username] -p [database_name] < bass.sql
```

Start PHP Server (laravel)
```
cd BASS/BASS_Env
php artisan serve --host={{hostip}} --port=8000

```

# Binderlabs API Security Scanner (BASS-Scanner)

Binderlabs API Security Simulator (BASS-Scanner) is design to aid cyber security professionals in API Security Testing. BASS-Scanner will identify security flaws pertaining to OWASP Top 10 API Security and more. It will also significantly reduce testing time for security professionals such as a Penetration tester during an API Pentest engagement.

## Requirements


1. Install the dependencies with:
```
git clone https://github.com/binderlabs/BASS.git
cd BASS/BASS_Scanner
pip3 install -r requirements.txt
```

2. Chrome browser to detect SSRF attacks.

## Features

### Fuzz Testing:
* Dynamic Fuzzing: Automatically generate and send a variety of malformed and unexpected data to API endpoints to identify vulnerabilities and unexpected behavior.

### Security Risk Detection:
* OWASP Top 10 Coverage: Perform automated scans to detect and report on security issues outlined in the OWASP Top 10 API Security Risks.
* Injection Detection: Identify and report on potential injection vulnerabilities such as SQL injection, NoSQL injection, and command injection.

### Authentication and Authorization Testing:
* Token Analysis: Evaluate the strength of authentication tokens and identify potential weaknesses in token handling mechanisms.
* Access Control Checks: Analyze API endpoints to ensure proper access controls are in place, preventing unauthorized access.


## Usage

Under construction…


## References

