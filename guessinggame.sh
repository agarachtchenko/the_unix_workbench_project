#! /bin/bash
# guessing game with some references to ancient movie
compare() {
	if [ $# -ne 2 ]
	then
		echo "${FUNCNAME}() requires 2 arguments"
		exit 1
	fi
	if [ $1 -gt $2 ]
	then
		return 1
	fi
	if [ $1 -lt $2 ]
	then
		return 2
	fi
	return 0
}

nfiles=$(ls -1 | wc -l)
echo "Would you like to play a game?"
echo "Guess how many files are in the current directory:"
while [ 1 ]
do 
	while [ 1 ]
	do
		read guess
		if [[ $guess =~ ^[0-9]+$ ]]
		then
			break
		fi
		echo "I need a number. Try again:"
	done
	compare $guess $nfiles
	result=$?
	if [ $result -eq 0 ]
	then
		break
	fi
	if [ $result -eq 1 ]
	then
		echo "No, there are fewer files. Try again:"
	fi
	if [ $result -eq 2 ]
	then
		echo "No, there are more files. Try again:"
	fi
done
echo "Congratulations! You won!"
echo "A strange game.The only winning move is not to play. How about a nice game of chess?"
