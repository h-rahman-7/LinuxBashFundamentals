# Over the wire Linux fundamentals

The 'Bandit Wargame' is a free resource that allows even beginners to get a taste of and learn Linux scripting. The game operates via a level system, with each level presenting more complex scenarios to resolve.

_Note that once you progress through each level you will have to exit and change the 'X' in accordance with the level you are in: ssh bandit'X'@bandit.labs.overthewire.org -p 2220_



## Bandit level 0:  
Objective: To log into game using SSH (secure shell)  
Solution: ssh bandit0@bandit.labs.overthewire.org -p 2220  
Comments: Using 'SSH' Secure shell to gain access into host url using port 2220

## Bandit level 0-1:
Objective: Find the password in a readme file to gain access to bandit level 1  
Solution: cat Readme  
Password: ZjLjTmM6FvvyRnrb2rfNWOZOTa6ip5If  
Comments: 'cat' Will print the contents of the Readme file without having to open it directly using "nano"

## Bandit level 1-2:
Objective: The password for the next level is stored in a file called '-' located in the home directory  
Solution: cat ./-  
Password: 263JGJPfgU6LtdEvgfWU1XP5yac29mFx  
Comments: Cannot use cat to open a file named '-', we use "." to look at current directory and "/" to go back a level and then cat the "-" file. E.g. refer to level 0-1

## Bandit level 2-3:
Objective: The password for the next level is stored in a file called 'spaces in this filename' located in the home directory  
Solution: cat spaces\ in\ this\ filename  
Password: MNk8KNH3Usiio41PRUEoDFPqfxLPlSmx  
Comments: Similar to level 0

## Bandit level 3-4:
Objective: The password for the next level is stored in a hidden file in the inhere directory.  
Solution: cat ...Hiding-From-You  
Password: 2WmrDFRmJIq3IPxneAaMGhap0pFhF3NJ  
Comments: Navigate to the 'inhere' directory using cd inhere. Then use 'll' to list all files/sub-directories in this folder including hidden ones with more information.

## Bandit level 4-5:
Objective: The password for the next level is stored in the only human-readable file in the inhere directory. Tip: if your terminal is messed up, try the “reset” command.  
Solution: cat ./-file0[0-9]  
Password: 4oQYVPkxZOOEOO5pTW81FB8j8lxXGUQw  
Comments: Use 'll' to list all the files. You will notice there are several files with the same name, only diff is the integer at the end of the file name. Also remember where a file has a "-" you need to use "./". The "[0-9]" prints all the contents of "-file0X" given that the filename is the same. We can use the 'reset' command because the other files are non-human readable and therefore print non-readable text. This will reset the terminal to be easier to follow.

## Bandit level 5-6:
Objective: The password for the next level is stored in a file somewhere under the inhere directory and has all of the following properties:  
- human-readable  
- 1033 bytes in size  
- not executable  
Solution: find . -type f -size 1033c ! -perm /a+x  
Password: HWasnPhtq9AVKe0dmk45nxy20cvUa6EG  
Comments: "find ." look in current directory, "-type f" looking for a file, "-size 1033c" looking for a file that is 1033bytes in size (c stands for characters), "! -perm /a+x" This checks if anyone (owner, group, or others) does not have execute permissions on a file. 'a' means "all" (all users). +x means "execute" permission. !: This means "not."

## Bandit level 6-7:
Objective: The password for the next level is stored somewhere on the server and has all of the following properties:  
- owned by user bandit7  
- owned by group bandit6  
- 33 bytes in size  
Solution: find / -user bandit7 -group bandit6 -size 33c 2>/dev/null  
Password: morbNTDkSW6jIlUc0ymOdMaLnOlFVAaj  
Comments: '/' specifies the search starts from the root directory.  
- 'user bandit7' finds files owned by the user bandit7.  
- 'group bandit6' finds files owned by the group bandit6.  
- 'size 33c' looks for files that are 33 bytes in size (c stands for characters).  
- '2>/dev/null' suppresses error messages that you might get due to permission issues while searching. 

## Bandit level 7-8:
Objective: The password for the next level is stored in the file data.txt next to the word millionth  
Solution: grep "millionth" data.txt  
Password: dfwvzFQi4mU0wfNbFOe9RoWskMLg7eEc  
Comments: This command searches for the line in data.txt that contains the word "millionth" and prints it to the terminal. The line should display the word "millionth" followed by the password you need.

## Bandit level 8-9:
Objective: The password for the next level is stored in the file data.txt and is the only line of text that occurs only once  
Solution: cat data.txt | sort data.txt | uniq -u  
Password: 4CKMh1JI91bUIZZPXDqGanal4xvAg0JM  
Comments: cat data.txt: Displays the content of data.txt, but sort and uniq will handle the file processing, so cat is not strictly needed in the pipeline.  
sort: Sorts the lines, which is necessary for uniq to correctly find unique lines.  
uniq -u: Outputs lines that appear exactly once.

## Bandit level 9-10:
Objective: The password for the next level is stored in the file data.txt in one of the few human-readable strings, preceded by several ‘=’ characters.  
Solution: strings data.txt | grep "="  
Password: FGUW5ilLVJrxX9kMYMmlN4MgbpfMiqey  
Comments: The strings command in Linux is used to find and display readable (printable) text strings in binary files or other files that contain non-text data. It helps extract human-readable characters from files that are otherwise mostly binary or contain non-printable characters. You can use strings with other commands like grep to filter specific strings

## Bandit level 10-11:
Objective: The password for the next level is stored in the file data.txt, which contains base64 encoded data  
Solution:  base64 --decode data.txt  
Password: dtR173fZKb0RRsDFSGsg2RWnpNVj3qRr  
Comments: Why Use Base64? It turns any data (like an image or a document) into a string of letters, numbers, and symbols (like a-z, A-Z, 0-9, +, /).  

How Does It Work? Base64 takes the binary data and divides it into chunks, then converts these chunks into readable characters.  
Example = Imagine you have a simple text: Hi.  
Binary Conversion: Hi in binary is 01001000 01101001.  
Base64 Encoding: The binary is grouped and converted into characters: SGk=.  
Now, SGk= is the Base64-encoded version of Hi.

When is Base64 Used?
Emails: To safely send attachments.
Web: To embed images or files in HTML/CSS.
APIs: To send binary data (like files) as part of a JSON payload.
In Short, Base64 encoding makes it possible to send and store any type of data as text, which is easier to handle in many systems and applications.

