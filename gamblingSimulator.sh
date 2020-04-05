#!/bin/bash

#Constants
STAKE=100
BET=1
PERCENTAGE=50
WIN=$(($PERCENTAGE*$STAKE/100 + $STAKE))
LOSE=$(($STAKE - $PERCENTAGE*$STAKE/100))
TOTAL_DAYS=20
TOTAL_STAKE_FOR_MONTH=$(($TOTAL_DAYS * $STAKE))

#To check if Win or Lose by BET
function wonOrLose() {
	for ((day=1; day<=$TOTAL_DAYS; day++))
	do
		amount=$STAKE
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
		totalAmount=$(($totalAmount + $amount))
	done
	finalResults
}

#To resign if stake would reach either 50 or 100
function checkResignForADay() {
	if [ $amount -eq $WIN ]
	then
		echo "Day $day: WON 50% of your stake. You can resign for a day"
	else
		echo "Day $day: LOST 50% of your stake. You can resign for a day"
	fi
}

#To get the final results after 20 days
function finalResults() {
	echo "Amount is hand: $totalAmount"
	if [ $totalAmount -gt 2000 ]
	then
		echo "Won!! Total amount Won: $(($totalAmount - 2000))"
	elif [ $totalAmount -lt 2000 ]
	then
		echo "Lost!! Total amount Lost: $((2000 - $totalAmount))"
	else
		echo "Neither Won or Lost"
	fi
}

#Main
wonOrLose
