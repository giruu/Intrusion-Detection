#!/bin/bash

# Clear the screen
clear

# Display the Introxt logo (assuming it's in a subdirectory named "Logo")
cd Logo && ./introxt_logo && cd ..

#Store the creds
mobileNo="your_mobile_number"
password="your_password"
num="number_to_receive_alert"

# Log in to Way2SMS and extract the session cookie
curl -i 'http://www.way2sms.com/re-login' \
    -H 'Origin: http://www.way2sms.com' \
    -H 'User-Agent: Mozilla/5.0' \
    --data "mobileNo=$mobileNo&password=$password&CatType=" \
    -o send.txt

# Extract the JSESSIONID cookie value
session_cookie=$(grep -oP 'Set-Cookie: JSESSIONID=\K[^;]+' send.txt)

# Get the authentication token
token=$(curl -s -i 'http://www.way2sms.com/send-sms' \
    -H 'Cookie: JSESSIONID='$session_cookie \
    -o send.txt \
    | grep -oP 'Token=\K[^"]+')

# Get the hostname of the current system
hostname=$(hostname)

# Send the alert message
curl -i 'http://www.way2sms.com/smstoss' \
    -H 'Cookie: JSESSIONID='$session_cookie \
    --data "Token=$token&message=Introxt $hostname is up &toMobile=$num&ssaction=ss" \
    -o send.txt

# Check for success and display a message
if [ $? -eq 0 ]; then
    echo "Message successfully sent!"
else
    echo "Failed to send message."
fi
