#!/bin/bash

#Constants
STAKE=100
BET=1
PERCENTAGE=50
WIN=$(($PERCENTAGE*$STAKE/100 + $STAKE))
LOSE=$(($STAKE - $PERCENTAGE*$STAKE/100))

#Variables
amount=$STAKE

#To Win or Lose by BET
function wonOrLose() {
	while [[ $amount -ne $WIN && $amount -ne $LOSE ]]
	do
		if [ $((RANDOM%2)) -eq 0 ]
		then
			amount=$(($amount + $BET))
		else
			amount=$(($amount - $BET))
		fi
	done
	checkResignForADay
}

#To resign if stake would reach either 50 or 100
function checkResignForADay() {
	if [ $amount -eq $WIN ]
	then
		echo "You have WON 50% of your stake. You can resign for a day"
	else
		echo "You have LOST 50% of your stake. You can resign for a day"
	fi
}
wonOrLose
