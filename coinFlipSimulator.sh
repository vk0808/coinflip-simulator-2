#! /bin/bash -x

echo "Welcome to Coin Flip Simulator Program"


# Variable
MAX_PLAY=20
KEY1="Singlet"
KEY2="Doublet"

singlet=(0 0)
doublet=(0 0 0 0)
toss=0
combSinlt=(H T)
combDoblt=(HH HT TH TT)

perSinlt=(0 0)
perDoblt=(0 0 0 0)


# Declare a dictionary
declare -A flip


# Loop to generte multiple coin flips
while [ $toss -lt $MAX_PLAY ]
do
	#Generate Head/Tail
	coinFlipSinglet=$(( $RANDOM %2 ))
	coinFlipDoublet=$(( $RANDOM %4 ))

	#Check if it's H/T for Singlet
	if [ $coinFlipSinglet -eq 0 ]; then
		flip[$KEY1]="${flip[$KEY1]} H"
		(( singlet[0]++ ))
	else
		flip[$KEY1]="${flip[$KEY1]} T"
		(( singlet[1]++ ))
	fi


	#Check if it's HH/HT/TH/TT for Doublet
	if [ $coinFlipDoublet -eq 0 ]; then
		flip[$KEY2]="${flip[$KEY2]} HH"
		(( doublet[0]++ ))
	elif [ $coinFlipDoublet -eq 1 ]; then
		flip[$KEY2]="${flip[$KEY2]} HT"
		(( doublet[1]++ ))
	elif [ $coinFlipDoublet -eq 2 ]; then
		flip[$KEY2]="${flip[$KEY2]} TH"
		(( doublet[2]++ ))
	else
		flip[$KEY2]="${flip[$KEY2]} TT"
		(( doublet[3]++ ))
	fi


	(( toss++ ))

done


# Function to calculate percentage
function percent() {
	local n=$1
	echo $n $toss | awk '{ print (($1 * 100 )/ $2) }'
}



# Function to display the outcomes
function display(){

	declare -a count=($1)
	local arr=("$2")
	declare -a com=($3)
	per=($4)


	# Print Singlet combination stored in dictionary
	echo "Combination: ${arr[*]}"


	# Print percentages
	for i in ${!count[*]}
	do
		per[$i]=$(percent ${count[$i]})
		echo -n "${com[$i]}-${per[$i]}%  "
	done
	echo ""
}


# Function call
display "${singlet[*]}" "${flip[$KEY1]}" "${combSinlt[*]}" "${perSinlt[*]}"
echo -e "\n"
display "${doublet[*]}" "${flip[$KEY2]}" "${combDoblt[*]}" "${perDoblt[*]}"
