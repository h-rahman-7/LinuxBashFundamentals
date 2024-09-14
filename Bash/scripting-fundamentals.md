# Bash scripting fundamentals guide 

_To ensure your computer can run your Bash scripts, start with #!/bin/bash to specify the interpreter. It’s also best to store commonly used scripts in the ~/bin/ directory._

## Bash Shebang
`The shebang (#!):` tells the system that the file is a script and specifies the interpreter to use.
/bin/bash: This is the path to the Bash shell, located in /bin/.
It tells the system to run the script using Bash, regardless of the current shell.
Example:
#!/bin/bash
echo "Hello, World!"

The #!/bin/bash line ensures the script is run with the Bash interpreter.

Why It’s Important:
Portability: Ensures the script runs with Bash on any system.
Consistency: Executes the script with Bash, even if you're using a different shell.

## Bash Script Arguments
`Arguments;` can be added to a bash script after the script’s name. Once provided they can be accessed by using $(position in the argument list). For example, the first argument can be accessed with $1, the second with $2, the third with $3, etc.

#!/bin/bash
'# For a script invoked by saycolors red green blue
'# echoes red
'echo $1

'# echoes green
'echo $2

'# echoes blue
'echo $3

## Bash Script Variables
`Variables:` in a bash script are set using the = sign and accessed using $.

greeting="Hello"
echo $greeting

## Bash script comparison operators
`Operators:` In bash scripting, strings are compared using the == (Equal) and != (Not equal) operators.

## Bash Aliases
`Aliases:` are shortcuts for longer commands. You use them to create shorter or easier-to-remember commands for running scripts or commands in Bash.

How to Create an Alias
Basic Alias:
alias shortname='longer_command'

Example:
alias ll='ls -la'