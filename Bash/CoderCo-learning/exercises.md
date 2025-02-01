# CoderCo Bash Scripting module exercises

![Alt Text](image1.png)

Understanding ${file%.txt}
`${file%.txt}` is a Bash expression that removes the .txt part from a filename.

Think of it as:

${file} → This means the full filename.
% → This means remove something from the end of the filename.
.txt → This is what we are removing.


## Running scripts from *anywhere*

- You need to place your script in one of the directories that's in your PATH environment variable
- PATH = an environment variable that tells the shell which directories to search for exec files in respect to commands

- if you run echo $PATH:

$ echo $PATH
/c/Users/hrahm/bin:/mingw64/bin:/usr/local/bin:/usr/bin:/bin:/mingw64/bin:/usr/bin:/c/Users/hrahm/bin:/c/Program Files/Common Files/Oracle/Java/javapath:/c/WINDOWS/system32:/c/WINDOWS:/c/WINDOWS/System32/Wbem:/c/WINDOWS/System32/WindowsPowerShell/v1.0:/c/WINDOWS/System32/OpenSSH:/c/Terraform:/cmd/bin:/bin:/c/Program Files/nodejs:/c/Program Files/Amazon/AWSCLIV2:/c/Program Files/Docker/Docker/resources/bin:/c/Program Files:/c/Program Files/Java/jdk-17/bin:/c/Users/hrahm/AppData/Local/Coursier/data/bin:/c/Program Files/MongoDB/Server/8.0/bin:/c/Program Files/mongosh-2.3.4-win32-x64/bin:/c/Program Files/Redis:/c/Program Files/stockfish:/c/Program Files/elasticsearch-8.16.1/bin:/c/Users/hrahm/AppData/Local/Programs/Python/Python312/Scripts:/c/Users/hrahm/AppData/Local/Programs/Python/Python312:/c/Users/hrahm/AppData/Local/Programs/Python/Launcher:/c/Users/hrahm/AppData/Local/Microsoft/WindowsApps:/c/Users/hrahm/AppData/Local/Programs/Microsoft VS Code/bin:/c/Users/hrahm/AppData/Roaming/npm:/c/Program Files/nodejs:/c/Users/hrahm/scala-cli:/c/Users/hrahm/AppData/Roaming/Code/User/globalStorage/github.copilot-chat/debugCommand:/usr/bin/vendor_perl:/usr/bin/core_perl:/c/Repositories/LinuxBash/LinuxBashFundamentals/Bash/bin

- you can place your script in any of these directories can be run from ANYWHERE in the terminal
- a common directory to place user scripts is usr/local/bin

### How do i move a file to a PATH directory?
- use: sudo mv script-name.sh /usr/local/bin/script-name
- note that 'mv' can be used to rename a file too
- note that '.sh' has been removed for easier usage
![alt text](image2.png)

### Why sudo?
- you need to use sudo because you need *_super user permissions*_ to move scripts into these directories


### How do you make it exectutable?

- chmod +x script-name.sh


## Variables

- assignment operator = assigning a value to a variable
- variables are not restricted to a specific data type; they're dynamic so can be used for a variety of things
- variables can store values for strings, numbers and arrays (see [var.sh](./var.sh))


## Arithmetic expansion calculations

- can perform mathematical calcs and evaluate expressions using the $ and (( )) notations 
- allows flexibility and dynamic scripts (see [arithmetic.sh](./arithmetic.sh) and [arithmetic2.sh](./arithmetic2.sh))
- arithmetic with parameters allows scripts to be even more dynamic see [arithmetic.sh](./arithmetic3.sharith)

## While loops

### **Understanding This Bash Script Step by Step (For Beginners)**  

This script **prints a list of fruits, one by one**. Let’s go through it slowly and explain each part in **plain English**.

---

## **Step 1: The First Line (`#!/bin/bash`)**
```bash
#!/bin/bash
```
- This line **tells the system** that this script should be run using **Bash** (the shell interpreter).
- Every Bash script **starts with this line**.

---

## **Step 2: Creating a List (Array) of Fruits**
```bash
fruits=("apple" "banana" "orange")
```
- We create a **list** (also called an **array**) and name it `fruits`.
- This list contains **three items**: `"apple"`, `"banana"`, and `"orange"`.
- Arrays in Bash store multiple values inside **one variable**.

---

## **Step 3: Setting Up a Counter**
```bash
index=0
```
- We create a **counter** named `index` and set it to **0**.
- This counter **keeps track of which fruit we are printing**.

---

## **Step 4: Setting Up a `while` Loop**
```bash
while [ $index -lt ${#fruits[@]} ]
```
- `while` means: **"Keep repeating the following steps until a condition is false."**
- `[ $index -lt ${#fruits[@]} ]` checks **if the counter (`index`) is less than the number of fruits**.
  - `${#fruits[@]}` **counts the number of items** in the `fruits` array.
  - `-lt` means **"less than"**.
- The loop will **run until all fruits are printed**.

### **What This Condition Means in Plain English**
- If `index = 0`, check: **"Is 0 less than 3?"** → **Yes** ✅ → Run the loop.
- If `index = 1`, check: **"Is 1 less than 3?"** → **Yes** ✅ → Run the loop.
- If `index = 2`, check: **"Is 2 less than 3?"** → **Yes** ✅ → Run the loop.
- If `index = 3`, check: **"Is 3 less than 3?"** → **No** ❌ → **Stop the loop**.

---

## **Step 5: Printing the Fruit Name**
```bash
echo "Fruit: ${fruits[$index]}"
```
- `${fruits[$index]}` means:  
  - **Get the fruit at position `index`** in the list.
  - The first time (`index = 0`), this is **"apple"**.
  - The second time (`index = 1`), this is **"banana"**.
  - The third time (`index = 2`), this is **"orange"**.
- The `echo` command prints the fruit.

**Example Output:**
```
Fruit: apple
Fruit: banana
Fruit: orange
```

---

## **Step 6: Increasing the Counter**
```bash
((index++))
```
- This **adds 1 to the `index` variable**.
- The next time the loop runs, it **moves to the next fruit**.

---

## **Step 7: Ending the Loop**
```bash
done
```
- This marks the **end of the `while` loop**.
- The loop **runs again** until all fruits are printed.

---

## **Step-by-Step Execution of the Script**
| **Iteration** | **Index Value (`index`)** | **Condition (`index < 3`)?** | **Printed Output** | **What Happens Next?** |
|--------------|-----------------|-----------------|-----------------|-----------------|
| 1st loop | `0` | ✅ Yes (0 < 3) | `Fruit: apple` | `index` becomes `1` |
| 2nd loop | `1` | ✅ Yes (1 < 3) | `Fruit: banana` | `index` becomes `2` |
| 3rd loop | `2` | ✅ Yes (2 < 3) | `Fruit: orange` | `index` becomes `3` |
| 4th loop | `3` | ❌ No (3 < 3 is false) | **Loop stops** | **Script ends** |

---

## **Final Output**
```
Fruit: apple
Fruit: banana
Fruit: orange
```
---

## **What You Learned**
✅ How to **create an array** (list) in Bash.  
✅ How to **use a loop** to go through each item in an array.  
✅ How to **print each item** one by one.  
✅ How to **increase a counter** inside a loop.  

Now you can modify the script to loop through any list you want! 🚀