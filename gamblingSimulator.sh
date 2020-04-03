#!/bin/bash -x

#Constants
STAKE=100
BET=1

#Variables
amount=0

#To Win or Lose by BET
function wonOrLose() {
	amount=$STAKE
	if [ $((RANDOM%2)) -eq 0 ]
	then
		amount=$(($amount + $BET))
	else
      amount=$(($amount - $BET))
	fi
	echo $amount
}
wonOrLose
