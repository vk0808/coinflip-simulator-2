#! /bin/bash -x

echo "Welcome to Coin Flip Simulator Program"

# Variable
HEAD=1
MAX_PLAY=20
KEY="Singlet"

headCound=0
tailCound=0
toss=0


# Declare a dictionary
declare -A flip


# Loop to generte multiple coin flips
while [ $toss -lt $MAX_PLAY ]
do
	#Generate Head/Tail
	coinFlip=$(( $RANDOM %2 ))

	#Check if it's Head or Tail
	if [ $coinFlip -eq $HEAD ]; then
		flip[$KEY]="${flip[$KEY]} H"
		(( headCount++ ))
	else
		flip[$KEY]="${flip[$KEY]} T"
		(( tailCount++ ))
	fi

	(( toss++ ))

done


# Function to calculate percentage
function percent() {
	local n=$1
	echo $n $toss | awk '{ print (($1 * 100 )/ $2) }'
}


# Print Singlet combination stored in dictionary
echo ${!flip[*]} ${flip[*]}

# Print percentages
echo "Head: $(percent $headCount) %"
echo "Tail: $(percent $tailCount) %"
