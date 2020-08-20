echo "Welcome To The Program Of Gambling Simuation" 
printf "\n"

#arrays
declare -A winMaxBets
declare -A loseMaxBets

#Bet Function For Multiple Days
function checkBetForMonth() {
	#After 20 days of playing every day shwoing the total amount won or lost(UC4).
	read -p "Enter The Number Of Days For The Month You Are Gonna Play : " days
	
	#variables
	i=0
	amountLose=0
	amountWin=0
	betsWin=0
	betsLose=0
	daysLose=0
	daysWon=0
	count=1
	while [ $days -gt $i ]
	do
		#As a Gambler, would start with a stake of $ 100 every day and bet $1 every game(UC1).
		
		#constant
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
				betsWin=$(($betsWin+1))
			else
				stakeMoney=$(($stakeMoney - $betMoney))
				betsLose=$(($betsLose+1))
			fi
		done
		i=$(($i+1))

		if [ $stakeMoney -eq 50 ]
		then	

			loseMaxBets[$count]=$betsLose
			amountLose=$(($amountLose+50))
			daysLose=$(($daysLose+1))
			count=$(($count+1))
			echo "Day : $i " "Amount Lose : $amountLose"
		else
			winMaxBets[$count]=$betsWin			
			amountWin=$(($amountWin+50))
			count=$(($count+1))
			daysWon=$(($daysWon+1))
			echo "Day : $i " "Amount Won : $amountWin"
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

	luckyDays=$( printf "%s\n" ${!winMaxBets[@]} | sort -n )
	unluckyDays=$( printf "%s\n" ${!loseMaxBets[@]} | sort -n )
	echo "Lucky Days Are : " $luckyDays
	echo "Unlucky Days Are : "$unluckyDays
	dayFinder
	printf "\n"	
}

#Day Finder To Find Lucky And Unlucky Day(UC7)
function dayFinder(){
	#Showing luckiest day where I won maximum and my unluckiest day where I lost maximum(UC6)
	countWin=1
	while [[ -z ${winMaxBets[$countWin]} ]]
	do
		countWin=$((countWin+1))
	done
	
	maxBetsWin=${winMaxBets[$countWin]}
	for i in ${winMaxBets[@]}
	do
		if [[ $i -gt $maxBetsWin ]]
	     	then
			maxBetsWin=$i
		fi
	done
	for j in ${!winMaxBets[@]}
	do
		if [[ ${winMaxBets[$j]} -eq $maxBetsWin ]]
		then
			luckiestDay=$j
		fi
	done

	countLose=1
	while [[ -z ${loseMaxBets[$countLose]} ]]
	do
		countLose=$((countLose+1))
	done
	maxBetsLose=${loseMaxBets[$countLose]}
	for i in ${loseMaxBets[@]}
	do
		if [[ $i -gt $maxBetsLose ]]
	     	then
			maxBetsLose=$i
		fi
	done
	for j in ${!loseMaxBets[@]}
	do
		if [[ ${loseMaxBets[$j]} -eq $maxBetsLose ]]
		then
			unluckiestDay=$j
		fi
	done
	
	echo "The Luckiest Day is $luckiestDay With Maximum Bets Win Of $maxBetsWin"
	echo "The Unuckiest Day is $unluckiestDay With Maximum Bets Win Of $maxBetsLose"
}

#Main Code
checkBetForMonth

