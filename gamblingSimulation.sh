#!/bin/bash -x
echo "Welcome To The Program Of Gambling Simuation" 
printf "\n"
#As a Gambler, would start with a stake of $100 every day and bet $1 every game(UC1)."
stakeMoney=100
betMoney=1
read -p "Enter The Number Of Days You Gonna Play : " days
printf "\n"
#As a Gambler make $1 bet so either win or loose $1(UC2)"
function checkBet() {
	if [ $(($RANDOM % 2)) -eq 1 ]
	then
		echo "You Won The Bet "
		stakeMoney=$(($stakeMoney + $betMoney))
	else
		echo "You Lose The Bet "
		stakeMoney=$(($stakeMoney - $betMoney))
	fi
}
checkBet
