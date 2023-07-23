#!/bin/bash
clear
banner='''
______________¶¶¶
_____________¶¶_¶¶¶¶
____________¶¶____¶¶¶
___________¶¶¶______¶¶
___________¶¶¶_______¶¶
__________¶¶¶¶________¶¶
__________¶_¶¶_________¶¶
__________¶__¶¶_________¶¶____¶¶
__________¶__¶¶__________¶¶¶¶¶¶¶
_________¶¶__¶¶¶______¶¶¶¶¶¶___¶
_________¶¶___¶¶__¶¶¶¶¶¶__¶¶
_______¶¶_¶____¶¶¶¶________¶¶       ████████╗██████╗░██╗░░░██╗██╗███╗░░██╗░██████╗░
______¶¶__¶¶___¶¶__________¶¶       ╚══██╔══╝██╔══██╗╚██╗░██╔╝██║████╗░██║██╔════╝░
_____¶¶____¶¶___¶¶__________¶¶      ░░░██║░░░██████╔╝░╚████╔╝░██║██╔██╗██║██║░░██╗░
___¶¶_______¶¶___¶¶_________¶¶      ░░░██║░░░██╔══██╗░░╚██╔╝░░██║██║╚████║██║░░╚██╗
___¶¶¶¶¶¶¶¶¶¶¶¶¶__¶¶_________¶      ░░░██║░░░██║░░██║░░░██║░░░██║██║░╚███║╚██████╔╝
_¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶_¶¶________¶¶     ░░░╚═╝░░░╚═╝░░╚═╝░░░╚═╝░░░╚═╝╚═╝░░╚══╝░╚═════╝░     
¶¶__¶¶¶¶¶¶____¶¶¶¶¶¶¶¶¶______¶¶     ░█████╗░░█████╗░███╗░░██╗███╗░░██╗███████╗░█████╗░████████╗██╗░█████╗░███╗░░██╗
¶¶¶¶¶___¶______¶___¶¶¶¶¶_____¶¶     ██╔══██╗██╔══██╗████╗░██║████╗░██║██╔════╝██╔══██╗╚══██╔══╝██║██╔══██╗████╗░██║
________¶¶¶¶¶¶¶¶______¶¶¶¶¶_¶¶      ██║░░╚═╝██║░░██║██╔██╗██║██╔██╗██║█████╗░░██║░░╚═╝░░░██║░░░██║██║░░██║██╔██╗██║
______¶¶¶¶¶¶¶¶¶¶¶________¶¶¶¶       ██║░░██╗██║░░██║██║╚████║██║╚████║██╔══╝░░██║░░██╗░░░██║░░░██║██║░░██║██║╚████║
______¶¶¶¶¶¶¶¶¶¶¶¶                  ╚█████╔╝╚█████╔╝██║░╚███║██║░╚███║███████╗╚█████╔╝░░░██║░░░██║╚█████╔╝██║░╚███║
______¶__¶¶_¶¶¶¶¶¶                  ░╚════╝░░╚════╝░╚═╝░░╚══╝╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝░╚════╝░╚═╝░░╚══╝
_____¶¶______¶___¶
_____¶¶_____¶¶___¶
_____¶______¶¶___¶
____¶¶______¶¶___¶¶
____¶¶______¶¶___¶¶
___¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
__¶¶¶¶¶¶¶¶¶_¶¶¶¶¶¶¶¶
__¶¶________¶¶¶____¶¶
____¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
'''
> IpsOn.txt
echo "$banner" | lolcat -p

arquivo_ips="ips.txt"
top_portas="21 22 23 25 53 80 110 135 139 143 179 443 445 514 587 631 993 995 1723 3306 3389 5900 8000 8080 8443 8888 9100 9999 10000 49152"

while IFS= read -r ip || [[ -n "$ip" ]]; do
  for porta in $top_portas; do
    if nc -zv -w2 "$ip" "$porta" >/dev/null 2>&1; then
      echo -e "\e[32m •\e[0m IP $ip, Porta $porta"
      echo "nc $ip $porta" >> "IpsOn.txt"
    else
      echo -e "\e[31m •\e[0m $ip"
      break
    fi
  done
done < "$arquivo_ips"
chmod +x atk.sh
bash atk.sh