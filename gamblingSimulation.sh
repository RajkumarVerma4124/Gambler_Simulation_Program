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
		stakeMoney=100				
		betMoney=1
		dailyStake=$stakeMoney;
		totalStake=$(($totalStake+$dailyStake))
		highStake=$((stakeMoney + stakeMoney/2))
		lowStake=$((stakeMoney - stakeMoney/2))
		while [ $stakeMoney -gt $((lowStake)) ] && [ $stakeMoney -lt $((highStake)) ]
		do	
			if [ $(($RANDOM % 2)) -eq 1 ]
			then
				stakeMoney=$(($stakeMoney + $betMoney))
			else
				stakeMoney=$(($stakeMoney - $betMoney))
			fi
		done
	if [ $stakeMoney -eq 50 ]
	then
		amountLose=$(($amountLose+50))
	else
		amountWin=$(($amountWin+50))
	fi
	days=$(($days-1))
	done

	#After 20 days of playing every day Shwoing the total amount won or lost(UC4)."
	totalAmount=$(($totalStake+($amountWin-$amountLose)))
	echo "Total Amount Spend On The Bets : $totalStake"
	echo "You Won The Total Amount Of : $amountWin"
	echo "You Lose The Total Amount Of : $amountLose"
	echo "After 20 Days You Have Total Amount Of : $totalAmount" 
}

checkBet
