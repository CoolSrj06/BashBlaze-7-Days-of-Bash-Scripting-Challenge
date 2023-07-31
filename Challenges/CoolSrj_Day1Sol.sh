#!/bin/bash

# Task 1
# This script inputs the name and age of the user and prints it in a perticula format.
# Then it takes input of two number and returns their sum.
# It also prints the file name and number of arguments used and the Process ID of the script.
# It also prints the number of ssh file in the current directory.

echo "Executing Task 2"
# in the below script the echo command is used to print desired message/output.
echo
echo "Enter your Name"
read name
echo "Enter your age"
read age

echo #print empty line


echo "Executing Task 3"
greet="Hello $name"

echo #print empty line
echo "$greet, you are $age years old"

echo #print empty line
echo "Executing Task 4"

echo "Enter first number"
read num1

echo

echo "Enter second number" 
read num2

echo

result=$((num1 + num2))

echo "The sum is $result"

echo
echo "Executing Task 5"
echo "The name of the bash script is $0, there are $# command line arguments passed, and $$, it is the process ID"

echo
echo "Executing Task 6"
#
echo "The files with .sh extension in current directory are"
echo 
ls *.sh
