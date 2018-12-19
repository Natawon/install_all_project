#!/bin/bash

# if (whiptail --title "SET E-Learning" --yesno "This is automated setup SET E-Learning platforms. \nWhould you like to RUN this setup?" 10 60) then
#     echo "You chose Yes. Exit status was $?."
# else
#     echo "You chose No. Exit status was $?. BYE!"
#     exit;
# fi

CHOICE=$(whiptail --title "Setup SET E-Learning plafroms" --menu "Where is your source code?" 16 100 9 \
	"1)" "Interactive scripts - you need to choose some options" \
	"2)" "Full automated - you need to prepare web.tar.gz, db.tar.gz" \
    "3)" "End"  3>&1 1>&2 2>&3)

case $CHOICE in
	"1)")
        ./setup-host.sh
	;;
	"2)")
        ./setup-host-automated.sh
	;;
    "3)") exit
    ;;
esac


