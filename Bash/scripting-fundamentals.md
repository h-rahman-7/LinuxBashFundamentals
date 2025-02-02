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

## Bash Script Arguments/parameters

`Arguments/parameters:` can be added to a bash script after the script’s name. Once provided they can be accessed by using $(position in the argument list). For example, the first argument can be accessed with $1, the second with $2, the third with $3, etc.

#!/bin/bash
'# For a script invoked by saycolors red green blue
'# echoes red
'echo $1

'# echoes green
'echo $2

'# echoes blue
'echo $3
## Why Are Bash Script Arguments Important in DevOps & Production?

Bash script arguments are extremely important in real-world DevOps and production environments because they make scripts flexible, reusable, and automated. Instead of writing separate scripts for different tasks, arguments allow you to pass dynamic inputs so the same script can handle multiple situations.

### 1️⃣ Automating Infrastructure Tasks

#### Example: Deploying an ECS Service

Imagine you need to deploy a containerized app to AWS ECS, but you want flexibility in specifying:

- The environment (dev, staging, or prod)
- The Docker image version (latest, stable, or a specific tag)

Instead of writing three separate scripts, you use arguments:

**Script: deploy_to_ecs.sh**

```bash
#!/bin/bash

ENVIRONMENT=$1  # First argument: Environment (dev, staging, prod)
IMAGE_TAG=$2    # Second argument: Docker image version

echo "Deploying to $ENVIRONMENT using image version $IMAGE_TAG"

aws ecs update-service --cluster my-cluster \
  --service my-service-$ENVIRONMENT \
  --force-new-deployment \
  --task-definition my-task:$IMAGE_TAG
```

Run the script like this:

```bash
./deploy_to_ecs.sh dev latest
./deploy_to_ecs.sh prod v2.3.1
```

✅ Instead of hardcoding values, the script adapts dynamically based on the inputs.

### 2️⃣ Managing AWS S3 Buckets Dynamically

#### Example: Uploading a File to Different Buckets

Imagine you need to upload files to different AWS S3 buckets depending on the environment.

**Script: upload_to_s3.sh**

```bash
#!/bin/bash

BUCKET_NAME=$1  # First argument: S3 Bucket Name
FILE_PATH=$2    # Second argument: File to upload

aws s3 cp $FILE_PATH s3://$BUCKET_NAME/
echo "Uploaded $FILE_PATH to S3 bucket: $BUCKET_NAME"
```

Run the script like this:

```bash
./upload_to_s3.sh my-dev-bucket config.json
./upload_to_s3.sh my-prod-bucket logs.txt
```

✅ The same script is used for multiple S3 buckets by passing different arguments.

### 3️⃣ Automating Database Backups (DynamoDB, MySQL, PostgreSQL)

#### Example: Backing Up a Database to S3

In production, you need to schedule database backups daily and store them in S3. Instead of writing a new script each time, arguments make it flexible.

**Script: backup_db.sh**

```bash
#!/bin/bash

DB_NAME=$1      # First argument: Database name
BACKUP_FILE=$2  # Second argument: Backup file name

pg_dump $DB_NAME > $BACKUP_FILE
aws s3 cp $BACKUP_FILE s3://my-backups/
echo "Backup of $DB_NAME saved as $BACKUP_FILE and uploaded to S3"
```

Run the script like this:

```bash
./backup_db.sh production_db backup_20240129.sql
./backup_db.sh dev_db backup_20240129_dev.sql
```

✅ Works for any database by just passing different arguments.

### **Is `DB_NAME=$1` and `BACKUP_FILE=$2` a Variable or an Argument?**  

**Answer: They are **both**! But in different ways.**  

---

### **1. `$1` and `$2` Are Arguments (Positional Parameters)**
- **`$1` and `$2` are arguments passed to the script when running it.**
- These are also called **positional parameters** because their position (`$1`, `$2`, `$3`, etc.) determines their value.

✅ **Example: Running the Script with Arguments**
```bash
./script.sh my_database backup.sql
```
- Here, **"my_database" is `$1`** and **"backup.sql" is `$2`**.
- Inside the script, `$1` and `$2` **store these values temporarily**.

---

### **2. `DB_NAME` and `BACKUP_FILE` Are Variables**
```bash
DB_NAME=$1      # my_database
BACKUP_FILE=$2  # backup.sql
```
- These **are variables because we assign them a value**.
- `DB_NAME` now **stores** whatever `$1` was.
- `BACKUP_FILE` now **stores** whatever `$2` was.

✅ **After assignment:**
```bash
DB_NAME="my_database"
BACKUP_FILE="backup.sql"
```
These variables **can now be used anywhere in the script**.

---

### **Final Answer**
| **Term** | **What It Does** | **Example** |
|----------|-----------------|-------------|
| **Argument (`$1`, `$2`)** | Comes from **outside the script** when you run it | `./script.sh my_database backup.sql` (`$1="my_database"`, `$2="backup.sql"`) |
| **Variable (`DB_NAME`, `BACKUP_FILE`)** | Stores values **inside the script** | `DB_NAME=$1` → `DB_NAME="my_database"` |

**✅ `$1` and `$2` are arguments.**  
**✅ `DB_NAME` and `BACKUP_FILE` are variables.**  



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

### Operators: Bash Comparison Operators
Bash scripts use specific operators for comparing numbers and strings.

### Number Comparison Operators:

`-eq:` Equal  
`-ne:` Not equal  
`-lt:` Less than  #
`-le:` Less than or equal  
`-gt:` Greater than  
`-ge:` Greater than or equal  
`-z:` Is null (checks if a string is empty)  
Example: If $index is less than 5, print it:

if [ "$index" -lt 5 ]; then  
 echo "$index"  
  fi

### String Comparison Operators:

`==:` Equal  
`!=:` Not equal  
When comparing strings, always use quotes around variables to avoid errors with empty values or spaces.

Example: Compare if $foo equals $bar:

if [ "$foo" == "$bar" ]; then  

    echo "Strings are equal"  

fi


### File Comparison Operators

`-e`  
Description: Checks if a file exists.  
Example: [ -e "$file" ] returns true if the file exists.

`-f`  
Description: Checks if a file is a regular file (not a directory or other special type).  
Example: [ -f "$file" ] returns true if it is a regular file.

`-d`  
Description: Checks if a file is a directory.  
Example: [ -d "$dir" ] returns true if it is a directory.

`-r`  
Description: Checks if a file has read permission.  
Example: [ -r "$file" ] returns true if the file is readable.

`-w`  
Description: Checks if a file has write permission.  
Example: [ -w "$file" ] returns true if the file is writable.

`-x`  
Description: Checks if a file has execute permission.  
Example: [ -x "$file" ] returns true if the file is executable.


### Logical Operators

`&&`  
Description: Logical AND. Both conditions must be true.  
Example: [ $a -eq 1 ] && [ $b -eq 2 ] returns true if both conditions are true.

`||`  
Description: Logical OR. At least one condition must be true.  
Example: [ $a -eq 1 ] || [ $b -eq 2 ] returns true if either condition is true.

`!`  
Description: Logical NOT. Reverses the condition.  
Example: [ ! -e "$file" ] returns true if the file does not exist.


### Additional Special Parameters

`$#`  
Description: This retuns the number of arguments that passed in, it holds the count of arguments  
Example: echo "Number of arguments: $#"

`$0`  
Description: This is a special parameter that returns the name of the script  
Example: echo "Script Name: $0"

`$1` # Also applies to $2, 3, 4 etc  
Description: This is returns the first line of the command line output  
Example: echo "First argument: $1"

`$@`  
Description: This variable echos all the arguments that have been passed in.  
Example: echo "All args: $@"


### **A Beginner’s Guide to Brackets in Bash**

When writing Bash scripts, you will come across different types of brackets: `[]`, `[[ ]]`, `()`, `(( ))`, and `{ }`. Each serves a different purpose, and understanding when to use them is essential for writing clean and efficient scripts. This guide explains their roles in simple terms with examples.

---

## **1. Square Brackets `[ ... ]` – Basic Tests**
Square brackets are used for **checking conditions**, such as comparing numbers, strings, or testing file existence.

### **Checking Numbers**
```bash
num=10

if [ $num -gt 5 ]; then
    echo "Number is greater than 5"
fi
```
**Explanation:**
- `[ $num -gt 5 ]` checks if the value of `num` is **greater than 5**.
- If true, it prints: `Number is greater than 5`.

**Important Notes:**
- You **must** have spaces around `[ ]` or it won’t work.
- `-gt` (greater than), `-lt` (less than), `-eq` (equal) are used for comparing numbers.

---

### **Checking If a File Exists**
```bash
if [ -f "myfile.txt" ]; then
    echo "File exists"
fi
```
**Explanation:**
- `-f` checks if `"myfile.txt"` exists as a file.
- If the file is there, it prints: `File exists`.

---

## **2. Double Square Brackets `[[ ... ]]` – Advanced Tests**
Double square brackets provide **a safer and more powerful way** to test conditions.

### **Checking Multiple Conditions**
```bash
num=10

if [[ $num -gt 5 && $num -lt 20 ]]; then
    echo "Number is between 5 and 20"
fi
```
**Explanation:**
- This checks if `num` is **greater than 5 AND less than 20**.
- The `&&` (AND) operator works **inside `[[ ]]`** but not in `[ ]`.

### **Checking Text with Pattern Matching**
```bash
name="hello world"

if [[ $name =~ hello ]]; then
    echo "The word 'hello' is in the text"
fi
```
**Explanation:**
- `=~` allows you to check if **a string contains a pattern**.
- This prints: `The word 'hello' is in the text`.

---

## **3. Parentheses `( ... )` – Running Commands in a Subshell**
Single parentheses create **a temporary environment** (a subshell). Any changes made inside `( )` do not affect the rest of the script.

### **Example: Changing Directory in a Subshell**
```bash
echo "Current directory: $PWD"

(cd /tmp)  # This only changes the directory inside the parentheses

echo "Back to original directory: $PWD"
```
**Explanation:**
- `(cd /tmp)` temporarily changes the directory **inside the parentheses only**.
- When it exits, `$PWD` (the current directory) **remains unchanged**.

---

### **Running Multiple Commands in a Subshell**
```bash
echo "Before subshell"

(
  echo "Inside subshell"
  cd /tmp
  echo "Now in: $PWD"
)

echo "Back to main script"
echo "Still in: $PWD"
```
**Explanation:**
- Inside `( ... )`, a new shell is created.
- The directory change affects only the subshell.
- Once the subshell ends, the script **returns to the original directory**.

**When to Use `( )`:**
- When you want to run commands **without affecting the main script**.
- When you need to execute a temporary operation.

---

## **4. Double Parentheses `(( ... ))` – Arithmetic Calculations**
Double parentheses are used for **math operations** in Bash.

### **Example: Adding Numbers**
```bash
num=10

((num = num + 5))
echo "New number is $num"
```
**Explanation:**
- `((num = num + 5))` adds `5` to `num`.
- It prints: `New number is 15`.

### **Example: Incrementing a Number**
```bash
num=5
((num++))  # Adds 1 to num
echo $num  # Prints 6
```
**Explanation:**
- `((num++))` increases `num` by **1**.

**When to Use `(( ))`:**
- When performing calculations.
- When incrementing or decrementing variables.

---

## **5. Curly Braces `{ ... }` – Grouping Commands and Expanding Variables**
Curly braces are used for **two different purposes**.

### **Expanding Variables (`${}`)**
```bash
name="Bash"
echo "Hello, ${name}!"
```
**Explanation:**
- `${name}` ensures that **only `name` is expanded**.
- It prints: `Hello, Bash!`.

---

### **Grouping Multiple Commands Together**
```bash
{
  echo "Step 1: Doing something..."
  echo "Step 2: Processing..."
  echo "Step 3: Done!"
}
```
**Explanation:**
- All commands inside `{ ... }` **run together as a block**.

---

### **Redirecting Multiple Commands to a File**
```bash
{
  echo "Logging info..."
  echo "Details logged"
} > logfile.txt
```
**Explanation:**
- Everything inside `{ ... }` is **saved to `logfile.txt`**.

**When to Use `{ }`:**
- When grouping multiple commands **without creating a subshell**.
- When redirecting several commands **to a file at once**.

---

## **Key Differences Between `( )` and `{ }`**
| **Feature**  | **( ... ) (Subshell)** | **{ ... } (Command Grouping)** |
|-------------|----------------------|----------------------------|
| **Creates a new shell?**  | ✅ Yes (temporary environment) | ❌ No (runs in the same shell) |
| **Changes persist?** | ❌ No (everything resets after execution) | ✅ Yes (changes affect the whole script) |
| **Used for?** | Running temporary commands | Grouping multiple commands |
| **Example** | `(cd /tmp; echo $PWD)` | `{ echo "One"; echo "Two"; } > file.txt` |

---

## **Final Summary**
| **Bracket** | **Used For** | **Example** |
|------------|------------|------------|
| `[ ... ]` | Basic conditions (numbers, files) | `[ $num -gt 5 ]` |
| `[[ ... ]]` | Advanced conditions (text search, AND/OR) | `[[ $str =~ "hello" ]]` |
| `( ... )` | Runs commands in a temporary shell | `(cd /tmp && ls)` |
| `(( ... ))` | Arithmetic operations | `((num++))` |
| `{ ... }` | Variable expansion, grouping commands | `{ echo "One"; echo "Two"; } > file.txt` |

---

### **Final Thoughts**
- **Use `[ ... ]` for simple tests**, like checking numbers or files.
- **Use `[[ ... ]]` for advanced tests**, like checking words in text.
- **Use `( ... )` when you want a temporary environment** where changes don’t last.
- **Use `{ ... }` when you want to group multiple commands**.
- **Use `(( ... ))` for arithmetic operations** instead of using `expr`.

Understanding these brackets will help you write better Bash scripts with cleaner and more efficient code.