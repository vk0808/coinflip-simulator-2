#! /bin/bash -x

echo "Welcome to Coin Flip Simulator Program"

# Variable
HEAD=1

# Generate Head/Tail
coinFlip=$(( $RANDOM %2 ))


#Check if it's Head or Tail
if [ $coinFlip -eq $HEAD ]; then
 	echo "heads"
else
	echo "tails"
fi
