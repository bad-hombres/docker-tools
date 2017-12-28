## gowapt-docker

A docker image of the goWAPT tool, together with Seclists

## Github

* https://github.com/dzonerzy/goWAPT
* https://github.com/danielmiessler/SecLists

## Example

'''
gowapt -u "http://www.example.com/FUZZ" -w /usr/share/seclists/Discovery/Web_Content/Common_PHP_Filenames.txt -f "code == 200" -threads 1000
'''
