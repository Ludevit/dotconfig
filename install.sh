#!/bin/sh

pathrc=$HOME/.config/nano

red_color="\e[31m"
green_color="\e[32m"
yellow_color="\e[33m"
end_color="\e[0m"

# DEBUG echo "path to nano is: $pathrc"

# Checks for nanorc and user is promtmted to install nanorc
if [ -f $pathrc/nanorc  ]
then
	# Tells user that there alredy is a nanorc in ~/.config/nano
	echo "${yellow_color}There is already nanorc in your config directory.${end_color}"
	echo "${yellow_color}Please check: $pathrc ${end_color}"
else
	# If there is no nanorc user has a choise to install nanorc
	# DEBUG echo -e "${red_color}There is NO nanorc file.${end_color}"
	echo "do you want to install GNU Nano configuration file? [y/N]"
	read install_input
	if [ "$install_input" = "y" ]
	then
		echo "installing nanorc..."
		mkdir -v $pathrc && cp -v ./nanorc $pathrc/nanorc
		[ $? = 0 ] && echo "${green_color}It's Done. Enjoy your new GNU nano config.${end_color}" || echo "${red_color}installing failed at copying files over to $pathrc${end_color}"
	fi
fi

exit
