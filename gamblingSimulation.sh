echo "Welcome To The Program Of Gambling Simuation" 
printf "\n"
#constants
stakeMoney=100
betMoney=1
read -p "Enter The Number Of Days You Gonna Play : " days
printf "\n"
function checkBet() {
	#As a Calculative Gambler if won or lost 50% of the stake, would resign for the day(UC3)"
	while [ $days -gt 0 ]
	do	
		#As a Gambler, starting with a stake of $100 every day and bet $1 every game(UC1)."
		#variables
		stakeMoney=100				
		betMoney=1
		
		dailyStake=$stakeMoney;
		highStake=$((stakeMoney + stakeMoney/2))
		lowStake=$((stakeMoney - stakeMoney/2))
		while [ $stakeMoney -gt $((lowStake)) ] && [ $stakeMoney -lt $((highStake)) ]
		do	
			#As a Gambler making $1 bet so either win or loose $1(UC2)"
			if [ $(($RANDOM % 2)) -eq 1 ]
			then
				echo "You Won The Bet "
				stakeMoney=$(($stakeMoney + $betMoney))
			else
				echo "You Lose The Bet "
				stakeMoney=$(($stakeMoney - $betMoney))
			fi
		done
	echo "You Have Resign For The Day With The Stake Of : "$stakeMoney
	days=$(($days-1))
	done
}
checkBet
