#!/bin/bash
clear
banner='''
                      :::!~!!!!!:.
                  .xUHWH!! !!?M88WHX:.
                .X*#M@$!!  !X!M$$$$$$WWx:.
               :!!!!!!?H! :!$!$$$$$$$$$$8X:
              !!~  ~:~!! :~!$!#$$$$$$$$$$8X:
             :!~::!H!<   ~.U$X!?R$$$$$$$$MM!  ░█████╗░░█████╗░███╗░░██╗███╗░░██╗███████╗░█████╗░████████╗██╗███╗░░██╗░██████╗░░░░░░░░░░
             ~!~!!!!~~ .:XW$$$U!!?$$$$$$RMM!  ██╔══██╗██╔══██╗████╗░██║████╗░██║██╔════╝██╔══██╗╚══██╔══╝██║████╗░██║██╔════╝░░░░░░░░░░
               !:~~~ .:!M"T#$$$$WX??#MRRMMM!  ██║░░╚═╝██║░░██║██╔██╗██║██╔██╗██║█████╗░░██║░░╚═╝░░░██║░░░██║██╔██╗██║██║░░██╗░░░░░░░░░░
               ~?WuxiW*`   `"#$$$$8!!!!??!!!  ██║░░██╗██║░░██║██║╚████║██║╚████║██╔══╝░░██║░░██╗░░░██║░░░██║██║╚████║██║░░╚██╗░░░░░░░░░
             :X- M$$$$       `"T#$T~!8$WUXU~  ╚█████╔╝╚█████╔╝██║░╚███║██║░╚███║███████╗╚█████╔╝░░░██║░░░██║██║░╚███║╚██████╔╝██╗██╗██╗
            :%`  ~#$$$m:        ~!~ ?$$$$$$   ░╚════╝░░╚════╝░╚═╝░░╚══╝╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░╚══╝░╚═════╝░╚═╝╚═╝╚═╝
          :!`.-   ~T$$$$8xx.  .xWW- ~""##*"
.....   -~~:<` !    ~?T#$$@@W@*?$$      /`
W$@@M!!! .!~~ !!     .:XUW$W!~ `"~:    :
#"~~`.:x%`!!  !H:   !WM$$$$Ti.: .!WUn+!`
:::~:!!`:X~ .: ?H.!u "$$$B$$$!W:U!T$$M~
.~~   :X@!.-~   ?@WTWo("*$$$W$TH$! `
Wi.~!X$?!-~    : ?$$$B$Wu("**$RM!
$R@i.~~ !     :   ~$$$$$B$$en:``
?MXT@Wx.~    :     ~"##*$$$$M~ '''
echo "$banner" | lolcat -p

while IFS='' read -r linha || [[ -n "$linha" ]]; do
    eval "$linha"
    if [ $? -eq 0 ]; then
        response=$(nc -w2 "$linha" 80 < /dev/null 2>&1)
        if [[ $response != *"HTTP/1.1 501 Not Implemented"* ]]; then
            echo "Conexão bem-sucedida com $linha"
        fi
    fi
done < IpsOn.txt
