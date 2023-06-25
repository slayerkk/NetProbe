import os, time, socket, subprocess, re
# Códigos de cores do texto
os.system('clear')
nulo = "\033[0m"
negrito = "\033[1m"
sublinhado = "\033[4m"
preto = "\033[30m"
vermelho = "\033[31m"
verde = "\033[32m"
amarelo = "\033[33m"
azul = "\033[34m"
magenta = "\033[35m"
ciano = "\033[36m"
branco = "\033[37m"
print(f'''
                    {vermelho}.xU::::!~!!!!!:.
                  {vermelho}.xUHWH!! !!?M88WHX:.
                {vermelho}.X*#M@$!!  !X!M$$$$$$WWx:.
               {vermelho}:!!!!!!?H! :!$!$$$$$$$$$$8X:
              {vermelho}!!~  ~:~!! :~!$!#$$$$$$$$$$8X:
             {vermelho}:!~::!H!<   ~.U$X!?R$$$$$$$$MM!
             {vermelho}~!~!!!!~~ .:XW$$$U!!?$$$$$$RMM!
               {vermelho}!:~~~ .:!M"T#$$$$WX??#MRRMMM!
               {vermelho}~?WuxiW*`   `"#$$$$8!!!!??!!! 
             {vermelho}:X- M$$$$       `"T#$T~!8$WUXU~ {verde}███╗░░██╗███████╗████████╗██████╗░██████╗░░█████╗░██████╗░███████╗{verde}
            {vermelho}:%`  ~#$$$m:        ~!~ ?$$$$$$  {verde}████╗░██║██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔════╝{verde}
          {vermelho}:!`.-   ~T$$$$8xx.  .xWW- ~""##*"  {verde}██╔██╗██║█████╗░░░░░██║░░░██████╔╝██████╔╝██║░░██║██████╦╝█████╗░░{verde}
{vermelho}.....   -~~:<` !    ~?T#$$@@W@*?$$      /`   {verde}██║╚████║██╔══╝░░░░░██║░░░██╔═══╝░██╔══██╗██║░░██║██╔══██╗██╔══╝░░{verde}
{vermelho}W$@@M!!! .!~~ !!     .:XUW$W!~ `"~:    :     {verde}██║░╚███║███████╗░░░██║░░░██║░░░░░██║░░██║╚█████╔╝██████╦╝███████╗{verde}
{vermelho}#"~~`.:x%`!!  !H:   !WM$$$$Ti.: .!WUn+!`     {verde}╚═╝░░╚══╝╚══════╝░░░╚═╝░░░╚═╝░░░░░╚═╝░░╚═╝░╚════╝░╚═════╝░╚══════╝{verde}
{vermelho}:::~:!!`:X~ .: ?H.!u "$$$B$$$!W:U!T$$M~      {verde}NetProbe: Network Scanner & Device Connection Analyzer{verde}
{vermelho}.~~   :X@!.-~   ?@WTWo("*$$$W$TH$! `         {verde}By: </Slayer!>{verde}
{vermelho}Wi.~!X$?!-~    : ?$$$B$Wu("**$RM!            {verde}Github: https://github.com/slayerkk{verde}
{vermelho}$R@i.~~ !     :   ~$$$$$B$$en:``
{vermelho}?MXT@Wx.~    :     ~"##*$$$$M~
{nulo}''')
time.sleep(3)
os.system('sudo apt install nmap')
time.sleep(2)
print('''[*] - running''')

comando = "nmap -sn 192.168.0.1/24"
arquivo_saida = "ips.txt"

# Executar o comando e capturar a saída
saida = subprocess.check_output(comando, shell=True, stderr=subprocess.STDOUT, universal_newlines=True)

# Extrair os IPs usando expressões regulares
padrao_ip = r"\b(?:\d{1,3}\.){3}\d{1,3}\b"
ips_encontrados = re.findall(padrao_ip, saida)

# Armazenar os IPs no arquivo
with open(arquivo_saida, "w") as f:
    f.write("\n".join(ips_encontrados))
os.system('chmod +x scan.sh')
os.system('bash scan.sh')
