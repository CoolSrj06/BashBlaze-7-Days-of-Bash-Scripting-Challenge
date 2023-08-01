#!/bin/bash
#
echo
# the script will display a welcome message
echo "Wellcome to the solution for Day 2 task"
echo
# list all the files and directories in the current path
echo "All the files and directories in the current path are:"
echo
# each file and directory, the script will print its name and size in human-readable format (e.g., KB, MB, GB)
# to print in the format file1.txt (100 KB), the 5th coulumn were the size of file is listed enclose the small bracket between two double inverted comma's
ls -lh | awk '{print $9, "(" $5 ")"}'
echo

echo "Enter a line of text (Press Enter without text to exit):"
read string

# script will read the user's input until an empty string is entered
while [ -n "$string" ];
do
	count=0

	# each line of text entered by the user, the script will count the number of characters in that line.
	for(( i=0;i<${#string};i++ ))
	do
		count=$((count+1))
	done

	# character count for each line entered by the user will be displayed.
	echo $count
	echo
	read string
done
echo
echo "Exiting the Interactive Explorer. Goodbye!"
