##Over the wire Linux scripting fundamentals ##

The 'Bandit Wargame' is a free resource that allows even beginners to get a taste of and learn Linux scripting. The game operates via a level system, with each level presenting more complex scenarios to resolve.

Note that once you progress through each level you will have to exit and change the 'X' in accordance with the level you are in: ssh bandit'X'@bandit.labs.overthewire.org -p 2220



#Bandit level 0:
Objective: To log into game using SSH (secure shell)
Solution: ssh bandit0@bandit.labs.overthewire.org -p 2220
Comments: Secure shell into host using port 2220

#Bandit level 0-1:
Objective: Find the password in a readme file to gain access to bandit level 1
Solution: cat Readme 
Password: ZjLjTmM6FvvyRnrb2rfNWOZOTa6ip5If
Comments: This will print the contents of the Readme file without having to open it directly using "vi"

#Bandit level 1-2:
Objective: The password for the next level is stored in a file called - located in the home directory
Solution: cat ./-  
Password: 263JGJPfgU6LtdEvgfWU1XP5yac29mFx
Comments: Cannot use cat to open a file named '-', we use "." to look at current directory and "/" to go back a level and then cat the "-" file. E.g. refer to level 0-1

#Bandit level 2-3:
Objective: The password for the next level is stored in a file called spaces in this filename located in the home directory
Solution: cat spaces\ in\ this\ filename   
Password: MNk8KNH3Usiio41PRUEoDFPqfxLPlSmx
Comments: Similar to level 0

#Bandit level 3-4:
Objective: The password for the next level is stored in a hidden file in the inhere directory.
Solution: cat ...Hiding-From-You
Password: 2WmrDFRmJIq3IPxneAaMGhap0pFhF3NJ
Comments: Navigate to the 'inhere' directory using cd inhere. Then use 'll' to list all files/sub-directories in this folder with more information.

#Bandit level 4-5:
Objective: The password for the next level is stored in the only human-readable file in the inhere directory. Tip: if your terminal is messed up, try the “reset” command.
Solution: cat ./-file0[0-9]
Password: 4oQYVPkxZOOEOO5pTW81FB8j8lxXGUQw
Comments: Remember where a file has a "-" you need to use "./". The "[0-9]" prints all the contents of "-file0X" given that the filename is the same.

#Bandit level 5-6:
Objective: The password for the next level is stored in a file somewhere under the inhere directory and has all of the following properties:
- human-readable
- 1033 bytes in size
- not executable
Solution: find . -type f -size 1033c ! -perm /a+x
Password: HWasnPhtq9AVKe0dmk45nxy20cvUa6EG
Comments: 

#Bandit level 6-7:
Objective: The password for the next level is stored somewhere on the server and has all of the following properties:
- owned by user bandit7
- owned by group bandit6
- 33 bytes in size
Solution:
Password:
Comments:  
