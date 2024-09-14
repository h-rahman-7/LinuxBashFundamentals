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

`Arguments:` can be added to a bash script after the script’s name. Once provided they can be accessed by using $(position in the argument list). For example, the first argument can be accessed with $1, the second with $2, the third with $3, etc.

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

## Bash Aliases

`Aliases:` are shortcuts for longer commands. You use them to create shorter or easier-to-remember commands for running scripts or commands in Bash.

How to Create an Alias  
Basic Alias:  
alias shortname='longer_command'

Example:  
alias ll='ls -la'

## Bash script comparison operators

`Operators:` Bash Comparison Operators
Bash scripts use specific operators for comparing numbers and strings.

 `Number Comparison Operators:`

-eq: Equal  
-ne: Not equal  
-lt: Less than  #
-le: Less than or equal  
-gt: Greater than  
-ge: Greater than or equal  
-z: Is null (checks if a string is empty)  
Example: If $index is less than 5, print it:

if [ "$index" -lt 5 ]; then  
 echo "$index"  
  fi

 `String Comparison Operators:`

==: Equal  
!=: Not equal  
When comparing strings, always use quotes around variables to avoid errors with empty values or spaces.

Example: Compare if $foo equals $bar:

if [ "$foo" == "$bar" ]; then  

    echo "Strings are equal"  

fi

 `File Comparison Operators`

-e  
Description: Checks if a file exists.  
Example: [ -e "$file" ] returns true if the file exists.

-f  
Description: Checks if a file is a regular file (not a directory or other special type).  
Example: [ -f "$file" ] returns true if it is a regular file.

-d  
Description: Checks if a file is a directory.  
Example: [ -d "$dir" ] returns true if it is a directory.

-r  
Description: Checks if a file has read permission.  
Example: [ -r "$file" ] returns true if the file is readable.

-w  
Description: Checks if a file has write permission.  
Example: [ -w "$file" ] returns true if the file is writable.

-x  
Description: Checks if a file has execute permission.  
Example: [ -x "$file" ] returns true if the file is executable.

 `Logical Operators`

&&  
Description: Logical AND. Both conditions must be true.  
Example: [ $a -eq 1 ] && [ $b -eq 2 ] returns true if both conditions are true.

||  
Description: Logical OR. At least one condition must be true.  
Example: [ $a -eq 1 ] || [ $b -eq 2 ] returns true if either condition is true.

!  
Description: Logical NOT. Reverses the condition.  
Example: [ ! -e "$file" ] returns true if the file does not exist.


`Additional Special Parameters`

`$#`  
Description: This retuns the number of arguments that passed in, it holds the count of arguments  
Example: echo "Number of arguments: $#"

$0  
Description: This is a special parameter that returns the name of the script  
Example: echo "Script Name: $0"

$1 # Also applies to $2, 3, 4 etc  
Description: This is returns the first line of the command line output  
Example: echo "First argument: $1"

`$@`  
Description: This variable echos all the arguments that have been passed in.  
Example: echo "All args: $@"
