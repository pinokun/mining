#!/bin/bash

#Code By : NakoCoders

#Thanks For Momo-chan

banner(){

	printf "

	###################################

	####################################

	####### #######

	####### #######

	####### www.tatsumi-crew.net #######

	############### ###############

	############### ###############

	############### ###############

	############### ###############

	####### #### #### #######

	####### #### #### #######

	####### ############## #######

	####### ############## #######

	####### #######

	####################################

	####################################

	------------------------------------

	 NAKO MINING KUYS

	------------------------------------

"

}

mining(){

	getfoll && getbalance

	ambil=$(curl -s --compressed --cookie ${random}_tmp "http://followers.interinstplus.com/api.php" -L \

	--data "method=order.get&device_id=$deviceid&device_hash=$devicehash")	

	getdata=$(echo $ambil | grep -Po '(?<=id":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')

	username=$(echo $ambil | grep -Po '(?<=user_name":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')

	folowerid=$(echo $ambil | grep -Po '(?<=follower_id":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')

	if [[ $ambil =~ "photo_url" ]]; then

		printf "Ambil => Balance $getbalance\n" 

	else

		printf "Ambil => Balance Skiped\n" 	

	fi

}

getfoll(){

	satudigit=$(cat /dev/urandom | tr -dc '0-9' | fold -w 1 | head -n 1)

	duadigit=$(cat /dev/urandom | tr -dc '0-9' | fold -w 2 | head -n 1)

	deviceid="aeb9b2d289be2f41_26" #set 

	devicehash="bfefaf8f065c9ea93743dd3b11756e90" #set

	follow=$(curl -s 'http://followers.interinstplus.com/api.php' -H 'User-Agent: okhttp/'$satudigit'.'$satudigit'.'$satudigit'.'$duadigit'' -H 'Content-Type: application/x-www-form-urlencoded' --data "method=order.follow&device_id=$deviceid&device_hash=$devicehash&order_id=$getdata&user_id=$folowerid&skip=0&info=ok")

}

getbalance(){

	balance=$(curl -s 'http://followers.interinstplus.com/api.php' -H 'User-Agent: okhttp/'$satudigit'.'$satudigit'.'$satudigit'.'$duadigit'' -H 'Content-Type: application/x-www-form-urlencoded' --data "method=balance.get&device_id=$deviceid&device_hash=$devicehash")

	getbalance=$(echo $balance | grep -Po '(?<=balance":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g') 

}

banner

for (( ; ; )); do

    mining

done

wait