#!/bin/bash
trap '' 2
target=" NO TARGET "
while true
do
   clear
   echo "======================"
   echo "|----TOOLKIT MENU----|"
   echo "======================"
   echo ""
   echo "Current NMAP Target is:" $target""
   echo ""
   echo "Enter '1' to run NMAP:"
   echo "Enter '2' to configure NMAP:"
   echo "Enter '3' to view latest report:"
   echo "Enter 'Q' to quit:"
   echo ""
   echo "Enter your selection here and hit <return>.."
   read answer
   case "$answer" in



    1)
       clear
       echo "======================="
       echo "|NMAP SCAN IN PROGRESS|"
       echo "======================="
       nmap -sV --script freevulnsearch -oX nmapresults.xml "$target"
       xsltproc nmapresults.xml -o NMAPReport.html ;;

    2)
       clear
       echo "======================"
       echo "| NMAP CONFIGURATION |"
       echo "======================"
       echo "Enter the target(s) for the NMAP scan"
       echo "(Target can be individual IP or an IP range)"
       read target ;;

    3)
       if [ -e NMAPReport.html ]
       then
         clear
         echo "Opening Report..."
         xdg-open NMAPReport.html
       else
         clear
         echo "No Report Found!"
       fi ;;

    q)
       clear
       exit ;;
    Q)
       clear
       exit ;;


   esac



   echo ""
   echo -e "Hit the <return> key to continue.."
   read input
done
