#!/bin/bash

#zipper file_name output_name
#ask for method
#	1-zip	2-bz2	3-gz
#	4-tar	5-tar.gz	6-tar.bz2
show_menu(){
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    echo -e "${NORMAL}Select your compression method${NORMAL}"
    echo -e "\t${NUMBER} 1)${MENU} .7z ${RED_TEXT}(Recommended) ${NORMAL}\t${NUMBER} 2)${MENU} .rar ${NORMAL}"
    echo -e "\t${NUMBER} 3)${MENU} .zip ${NORMAL}\t${NUMBER} 4)${MENU} .bz2 ${NORMAL}"
    echo -e "\t${NUMBER} 5)${MENU} .gz ${NORMAL}\t${NUMBER} 6)${MENU} .tar ${NORMAL}"
    echo -e "\t${NUMBER} 7)${MENU} .tar.gz ${NORMAL}\t${NUMBER} 8)${MENU} .tar.bz2 ${NORMAL}"
    #echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${ENTER_LINE}Please enter a menu option and enter or ${RED_TEXT}enter to exit. ${NORMAL}"
    read opt
}
function option_picked() {
    COLOR='\033[01;31m' # bold red
    RESET='\033[00;00m' # normal white
    MESSAGE=${@:-"${RESET}Error: No message passed"}
    echo -e "${COLOR}${MESSAGE}${RESET}"
}

spinner() {
    local pid=$!
	spin='-\|/'

	i=0
	while kill -0 $pid 2>/dev/null
	do
	  i=$(( (i+1) %4 ))
	  printf "\r${spin:$i:1}"
	  sleep .1
	done
}

if (( $# != 2 ))
then
	echo -e "\e[1;31mIllegal number of parameters.\e[0m"
else
	input=$1
	output=$2
	
	#echo $input
	#echo $output
	#show zipping methods
	#-------------------------------------
	clear
	show_menu

    if [[ $opt = "" ]]; then 
            exit;
    else
        case $opt in
	1) clear;
        option_picked "You picked 7z method.";
        e=".7z"
	7z a $output$e $input > NUL
	spinner	
        echo -e "${MENU}$output$e file created. ${NORMAL}"
	;;
	
	2) clear;
        option_picked "You picked rar method.";
        e=".rar"
	spinner	
	rar a $output$e $input
        echo -e "${MENU}$output$e file created. ${NORMAL}"
	;;

        3) clear;
        option_picked "You picked zip method.";
        e=".zip"
	spinner	
	zip -r $output$e $input
        echo -e "${MENU}$output$e file created. ${NORMAL}"
	;;
        
	4) clear;
        option_picked "You picked bz2 method.";
        e=".bz2"
	spinner	
	tar -cvjSf $output$e $input
        echo -e "${MENU}$output$e file created. ${NORMAL}"
	;;

        5) clear;
        option_picked "You picked gz method.";
        e=".gz"
	spinner	
	tar -cvzf $output$e $input
        echo -e "${MENU}$output$e file created. ${NORMAL}"
	;;

        6) clear;
        option_picked "You picked tar method.";
        e=".tar"
	spinner	
	tar -cvzf $output$e $input
        echo -e "${MENU}$output$e file created. ${NORMAL}"
	;;
       
        7) clear;
        option_picked "You picked tar.gz method.";
        e=".tar.gz"
	spinner	
	tar -cvzf $output$e $input
        echo -e "${MENU}$output$e file created. ${NORMAL}"
	;;
        
	8) clear;
        option_picked "You picked tar.bz2 method.";
        e=".tar.bz2"
	spinner	
	tar -cvzf $output$e $input
        echo -e "${MENU}$output$e file created. ${NORMAL}"
	;;
	
	x)exit;
        ;;

        \n)exit;
        ;;

        *)clear;
        option_picked "Pick an option from the menu";
        show_menu;
        ;;
    esac
fi	
	#-------------------------------------
fi

