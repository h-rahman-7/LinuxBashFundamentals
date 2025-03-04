# Linux Fundamentals for beginners

## What is Linux?

- Linux is an open source OS, developed by Linus Torvalds.
- known for flexibility, security and strong community support
- the backbone of many servers, networks and cloud infrastructures around the world
- e.g. the video you're watching in Skool is running on a _linux server_

## Why learn linux?

- Essential for anyone in DevOps or IT roles
- widely used in servers, cloud services and networking
- cost effective and highly customisable; a very popular choice for businesses and developers

## Different distrubitions(versions) of Linux

- Think of these as the flavours of linux, e.g. Ubuntu, Santos and Debian etc. 
- These distro's are suited to different tasks
- E.g. Ubuntu is very beginner friendly 


## Setting up Linux by virtualisation 

- Can use virtualisation to run Linux (e.g. Ubuntu) on your computer without needing to replace your current OS
- We can use Virtual box (powerful and free virtualisation tool) to install and configure Ubuntu

## Installing Ubuntu for a Windows User:

### What is VirtualBox
- a powerful open source software tool that allows you to run entire OS's from scratch on your computer as if they were just another application 
- In this case we are on a windows laptop, we can install and run a guest OS like Ubuntu on top of your existing windows OS

### Why do we want to install Ubuntu?
- The motivation is to `grasp the concept of virtualisation` which forms the basis of modern cloud computing and devops practices
- `virtualisation allows multiple OS's to run on a single physical machine;` 
    - they share resources but remain isolated from each other 

- You can however, just run an EC2 ubuntu instance and shell into it

# Manual/help page

## Linux
- linux has a manual page that can be accessed by entering 'man' [argument]. This will give you a list of the manual pages related to that argument e.g. 'man ls' will give information about the 'ls' command and all its additional options
- you can also search 'man man' to get a manual on how to use the manual command

## Windows
- You cannot use the 'man' in windows rather instead of `man ls` you would use `ls --help`

# Progams and Binaries

- these commands that we've mentioned above are actually small programs and are written in a programming language and are compiled into a format that the computer can execute and understand; this is a `binary`
- e.g. the ls command is a small programm that lists the contents of the current directory

## Path environment variables
- tells the shell where it needs to search for these commands (or programs)
- so if i type in `echo $PATH` in my terminal:
`$ echo $PATH`
`/c/Users/hrahm/bin:/mingw64/bin:/usr/local/bin:/usr/bin:/bin:/mingw64/bin:/usr/bin:/c/Users/hrahm/bin:/c/Program Files/Common Files/Oracle/Java/javapath:/c/W` 

- note how there are many 'bin' folders; this just means the binary folder.
- the path env variable tells the shell in which directory it needs to look for these commands or programs that we run
- this happens all behind the scenes when you enter `ls` in your terminal


# Intro to the SHELL and other types

- The SHELL is a user interface that provides access to the OS's services 
- the layer between you and the core of the OS (kernel and hardware)
    - `User > SHELL > Kernel > Hardware`
    - translates commands into actions

## Different types of SHELLs:
- Bash shell
- Csh/Tsch shell
- Ksh shell
- Zsh shell
- Fish

Each shell above has its own purpose, features and capabilities *but* they all serve the same fundamental purpose; `to help you interact with the system`

- Most linux distributions come with Bash as a default shell. So If you enter `echo $SHELL` in your terminal it will most likely return `/bin/bash`


## Zsh shell
- Highly customisable and has advanced features like improved auto-completion and spell correction 

## Fish shell
- provides intuitive syntax highlighting and suggestions

_You can check the type of shells available on your system by using `cat /etc/shells`_


# Linux Features


## Touch and Echo commands

### Touch 
- The touch command in linux is primarily used to create _empty_ files but it can also be used to update the _timestamp_ of existing files
- `touch myfile.txt` will create an empty file
- everytime you open the myfile.txt using touch, when you run `ls -l` it will update the timestamp

### Echo
- This is used to display a line of text or a string that is passed as an argument
- e.g. echo "Hello world!" 
- you can also redirect (by using `>`) the text to a new file or an existing file e.g. `echo "Hello world" > myfile.txt`
- If i know type `echo "Hello world-1" > myfile.txt` this will overwrite the previous line
- you can check this by using the `cat` command to print and output the contents of a file
- if you do not want to overwrite the file, you can use the append operator `(>>)` comes into play

## 'head' and 'tail' Commands

- these commands are useful for viewing the beginning and ends of a file
- very helpful when dealing with very large files where you only need to see a few lines from the beginning or end of the file
- if you want a specific number of lines you can `-n X` e.g. `head -n 5 myfile.txt` 
- if you want a specific number of lines e.g. lines 6-10, you can make use of `piping (|)` you can run the following `head -n 10 myfile.txt | tail -n 5`

## VIM text editor
- The VIM command is a powerful text editor in linux 
- all you have to do is VIM [filename]; if file doesn't exist, it will create it
- press `i` to insert and make text edits
- press `v` to enter the visual mode which is used for selecting text
- to switch between visual mode and command mode all you have to do is press `esc`
- `h = left`
- `j = down`
- `k = up`
- `l = right`

- In order to save your edits you need to be in command mode and then `:wq!` 