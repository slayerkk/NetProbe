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
top_portas="8080 443 22 21 3389 23 25 53 110 143"

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