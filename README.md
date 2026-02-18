# Bash-Wordlist-Read-Example
pseudo-code example to demonstrate what sort of things we would need to do for creation of a bash script that iterates through a text file with a list of payloads one line at a time within a loop until a bypass is found

## Note:
This code isn't working properly. I haven't tested it. I just quickly wrote up an example of the scripting logic reuqired to make something like this work with the syntax matching what I remember from when I used to write stuff in bash more oftne.
I will update this into a fully-functional and powerful working script at a later date.

## Usage:
- you would need to ensure that your wordlist is saved in a dir that your user account has CRUD operations on (for example /tmp or any dir if you're a sudoer)
- Before running the script, you'd run the following bash one-liner command: ```cd /path/to/your/wordlist/dir ; mv my_wordlist.txt ../../../path/to/your/bash/script/my_wordlist.txt ; chmod +x script.sh ; ./script.sh```

