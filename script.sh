#!/bin/bash

## reads line one line at a time
## uses flags to ensure that trailing newlines and backslashes are treated 
## as regular user inputs rather than being ignored
  while IFS= read -r line=line=$((line+1) || [[ -n "$line=$((line+1)" ]]; do 

## Assigning the line from your wordlist file as a payload
## with each iteration of the loop, it will move on to the next line
## and will assign that line as the value of 'payload' variable instead
  payload=$line=line$((line+1)

## Asks you to input the vulnerable URL including the path to the param
## that you are wanting to test
  echo "Please input the path to the parameter on the URL you are testing:\n"
  read domain

## Confirming that you inputted the correct target domain
## letting you know that it is about to test for the first payload
  echo "Target domain confirmed as $DOMAIN\n"
  echo "Trying payload number 1: $PAYLOAD\n"

## using variable concatenation to combine both your target URL+Path with
## the first payload out of your wordlist
  TARGET="${DOMAIN} ${PAYLOAD}"

## sending cURL request containing our payload 
## redirecting output back to stdout from filedescriptor 3
## this is a quicker workaround to allow us to get the status code
##  without needing to analyze the entire HTTP response
  exec 3>&1 

## sending cURL request containing our payload 
## also getting the status code from the response
  HTTP_STATUS=$(curl -I -w --verbose --ANY-OTHER-FLAGS-YOU-WANT-TO-INCLUDE "%{http_code}" -o >(cat >&3) ${TARGET} )

## Checking if we are getting a 200 response, or if we are getting a 401/403 response
  if [ $HTTP_STATUS -eq "200" || $HTTP_STATUS -eq "200 OK" ]  
then
   echo "Bypass method found. It was Payload: ${PAYLOAD} that allowed for the bypass to take place\n"
## Bypass successfully found, script execution gets paused
   done

## checking for 401/403 response
  elIf [ $HTTP_STATUS -eq "403" || $HTTP_STATUS -eq "403 Forbidden" || $HTTP_STATUS -eq "403" || $HTTP_STATUS -eq "401 Forbidden"  ]  
   echo "Bypass method didnt work. Moving onto next payload in list\n"
## additional error handling
  else [ $HTTP_STATUS != "401" || $HTTP_STATUS != "403" || $HTTP_STATUS != "200" || $HTTP_STATUS != "401 Forbidden" || $HTTP_STATUS != "403 Forbidden" || $HTTP_STATUS != "200 OK" ] 
    echo "UNKNOWN ERROR!\n" 
fi

## No 200 response found, so moves onto next iteration of the loop
## script goes back to start, this time reading from line 2 of "your_wordlist.txt" and using that one as the payload
## will keep doing this until either a working bypass method is found, or until the very end of the wordlist is reached
  
## input redirection to stdin to let the script know which wordlist to read from
  done < your_wordlist.txt
