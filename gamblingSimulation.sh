echo "Welcome To The Program Of Gambling Simuation" 
printf "\n"

#Bet Function For Multiple Days
function checkBetForMonth() {
	#After 20 days of playing every day shwoing the total amount won or lost(UC4).
	read -p "Enter The Number Of Days For The Month You Are Gonna Play : " days
	
	#arrays
	declare -A amountWon
	declare -A amountLoss
	
	#variables
	i=0
	amountLose=0
	amountWin=0
	amount=0
	daysLose=0
	daysWon=0
	count=1
	while [ $days -gt $i ]
	do
		#As a Gambler, would start with a stake of $ 100 every day and bet $1 every game(UC1).
		
		#constant
		stakeMoney=100				
		betMoney=1

		totalStake=$(($totalStake + $stakeMoney))
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

		i=$(($i + 1))

		if [ $stakeMoney -eq 50 ]
		then	
			amountLose=$(($amountLose + 50))
			amount=$(($amount - 50))
			amountLoss[$count]=$amount
			daysLose=$(($daysLose + 1))
			echo "Day : $i " "Amount Lose : ${amountLoss[$count]}"
			count=$(($count + 1))
		else
			amountWin=$(($amountWin + 50))
			amount=$(($amount + 50))
			amountWon[$count]=$amount
			daysWon=$(($daysWon + 1))
			echo "Day : $i " "Amount Won : ${amountWon[$count]}"
			count=$(($count + 1))
		fi
	done
	#Each month Showing the days won and lost and by how much(UC5)."
	printf "\n"
	totalAmount=$(($totalStake+($amountWin-$amountLose)))
	echo "Total Amount Spend On The Bets : $totalStake"
	echo "You Won The Total Amount Of : $amountWin"
	echo "You Lose The Total Amount Of : $amountLose"
	echo "Total No. Of Days Won : $daysWon"
	echo "Total No. Of Days Lose : $daysLose"
	echo "After $i Days You Have Total Amount Of : $totalAmount" 

	daysWin=$( printf "%s\n" ${!amountWon[@]} | sort -n )
	daysLoss=$( printf "%s\n" ${!amountLoss[@]} | sort -n )
	echo "Days won are : " $daysWin
	echo "Days loss are : "$daysLoss
	
	dayFinder
	printf "\n"
	
	#If won continuing playing nextmonth or stop Gambling (UC7)
	if [[ $daysWon -gt $daysLose ]]
	then
		monthEligibility
	fi
}

#Day Finder To Find Lucky And Unlucky Day(UC6)
function dayFinder(){
	#Showing luckiest day where I won maximum and my unluckiest day where I lost maximum(UC6)
	
	countWin=1
	while [[ -z ${amountWon[$countWin]} ]]
	do
		countWin=$((countWin+1))
	done
	maxWinDay=${amountWon[$countWin]}	
	for i in ${amountWon[@]}
	do
		if [[ $i -gt $maxWinDay ]]
	     	then
			maxWinDay=$i
		fi
	done
	
	declare -A luckiestDay
	countDay=1
	for j in ${!amountWon[@]}
	do
		if [[ ${amountWon[$j]} -eq $maxWinDay ]]
		then
			luckiestDay[$countDay]=$j
			countDay=$(($countDay+1))
		fi
	done
	
	countLoss=1
	while [[ -z ${amountLoss[$countLoss]} ]]
	do
		countLoss=$((countLoss+1))
	done
	maxLoseDay=${amountLoss[$countLoss]}	
	for  i in ${amountLoss[@]}
	do
		if [[ $i -lt $maxLoseDay ]]
	     	then
			maxLoseDay=$i
		fi		
	done
	
	declare -A unluckiestDay
	countLossDay=1
	for j in ${!amountLoss[@]}
	do
		if [[ ${amountLoss[$j]} -eq $maxLoseDay ]]
		then
			unluckiestDay[$countLossDay]=$j
			countLossDay=$(($countLossDay+1))
		fi
	done

	if [[ $maxWinDay -gt 0 ]]
	then
	echo "The Luckiest Day is ${luckiestDay[@]} With $maxWinDay Rs"
	fi
	echo "The Unluckiest Day is ${unluckiestDay[@]} With $maxLoseDay Rs"
}

#PlayGame For Who Will Be Eligibile For Next Month(UC7) 
function monthEligibility(){
	read -p "You Are Eligible For Playing Next Month. Press Yes To Continue Or No To Exit The Game : " option
	if [ $option == "Yes" ]
	then
		checkBetForMonth
	else
		echo "Thanks For Playing See You Soon "
	fi
}

#Main Code
checkBetForMonth

