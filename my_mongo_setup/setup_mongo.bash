#! /usr/bin/bash

:'
Just a quick mongodb setup script to install mongodb using docker in a linux pc

'


#----------------constants---------------

# variables
install_mongo=false
run_mongo=true

#colors
readonly Red='\033[0;31m'
readonly Green='\033[;32m'
readonly NC='\033[0m' # No Color
# Bold
readonly BBlack='\033[1;30m'       # Black
readonly BRed='\033[1;31m'         # Red
readonly BGreen='\033[1;32m'       # Green
readonly BCyan='\033[1;36m'        # Cyan
# emoji
readonly WAVE='👋'
readonly GOOD='👌'
readonly BAD='🥵'
readonly BLOCK="**************************+++++++++++**************************"
 
readonly MONGO_SERVER='mongo_server'
readonly MONGO_PORT=27017
#-------**--------constants------**--------


clear;
cat << Delimeter
Hey you! Welcome to the installation script for mongodb.
I will help you install mongodb and start it up. 
By the way you need docker preinstalled, Ive not been charged up with that skill
Delimeter

sleep 1;

echo "$BLOCK";
systemctl status docker;

if systemctl status docker | grep -q 'active (running)'
then
	echo -e "${BGreen}Docker has been installed, we may proceed${GOOD}!${NC}"
else
	echo -e "${BRed}Docker is not present on the machine${BAD}${NC}"
	exit 1;
fi

sleep 1;

if docker images | grep -q 'mongo'
then
	echo "Yeepee"
else
	install_mongo=true
	echo "You don't have the mongo image, let me fetch it"
	echo "${BCyan}Pulling mongo:latest${WAVE}${NC}"
	docker pull mongo:latest;
fi
	

if docker images | grep -q 'mongo'
then
	echo -e "${BGreen}Mongo image has been pulled${GOOD}!${NC}"
else
	echo -e "${BRed}An error occured and I couldn't pull the image${BAD}${NC}"
fi

read -rp "Should I startup the mongo image for you; s for start, c for close mongo, anything else for no: " run_mongo;

sleep 1;
if [ "$run_mongo" == "s" ]
then
	echo "$BLOCK"
	echo -e "${BCyan}Starting the mongo daemon${WAVE}${NC}"
	sleep 1;
	echo -e "${BCyan} Setting up volume for persistence at mongo_dir${NC}"
	
	if ls $HOME | grep -q 'mongo_dir'
	then
		echo 'mongo_dir found'
	else
		sudo mkdir -p ~/mongo_dir
	fi

	docker run -it -v $HOME/mongo_dir:/data/db --name $MONGO_SERVER -p $MONGO_PORT:$MONGO_PORT -d mongo
elif [ "$run_mongo" == "c" ]
then
	docker stop $MONGO_SERVER;
	echo "Mongo instance stopped!" 
else
	exit 0;
fi

sleep 1
docker ps
if docker ps | grep -q 'mongo_server'
then
	echo -e "${BGreen}The mongo container has been started successfully!${GOOD}!${NC}"
else
	docker rm -f $MONGO_SERVER
	echo -e "${BRed}Mongo is no longer runnng!${BAD}${NC}"	
fi
