echo "Welcome To The Program Of Gambling Simuation" 
printf "\n"
function checkBet() {
	#Each month Showing the days won and lost and by how much(UC5)."
	#variables
	i=0
	amountLose=0
	amountWin=0
	read -p "Enter The Number Of Days You Gonna Play : " days
	while [ $days -gt $i ]
	do
		#As a Gambler, would start with a stake of $ 100 every day and bet $1 every game(UC1).
		#constants
		stakeMoney=100				
		betMoney=1	

		totalStake=$(($totalStake+$stakeMoney))
		highStake=$((stakeMoney + stakeMoney/2))
		lowStake=$((stakeMoney - stakeMoney/2))

		#As a Calculative Gambler if won or lost 50% of the stake, would resign for the day(UC3)"
		while [ $stakeMoney -gt $((lowStake)) ] && [ $stakeMoney -lt $((highStake)) ]
		do
			#As a Gambler making $1 bet so either win or loose $1(UC2)	
			if [ $(($RANDOM % 2)) -eq 1 ]
			then
				stakeMoney=$(($stakeMoney + $betMoney))
			else
				stakeMoney=$(($stakeMoney - $betMoney))
			fi
		done
		i=$(($i+1))

		if [ $stakeMoney -eq 50 ]
		then
			amountLose=$(($amountWin+50))
			daysLose=$(($daysLose+1))
			echo "Day : $i " "Amount Lose : $amountLose"
		else
			amountWin=$(($amountWin+50))
			daysWon=$(($daysWon+1))
			echo "Day : $i " "Amount Won : $amountWin"
		fi
	
	done
	printf "\n"
	#After no. Of days of playing Showing the total amount won or lost(UC4)."
	totalAmount=$(($totalStake+($amountWin-$amountLose)))
	echo "Total Amount Spend On The Bets : $totalStake"
	echo "You Won The Total Amount Of : $amountWin"
	echo "You Lose The Total Amount Of : $amountLose"
	echo "Total No. Of Days Won : $daysWon"
	echo "Total No. Of Days Lose : $daysLose"
	echo "After $i Days You Have Total Amount Of : $totalAmount" 
}
checkBet
