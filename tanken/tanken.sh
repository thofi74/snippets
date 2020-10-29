#!/bin/sh
#
# crontab: 0,5,10,15,20,25,30,35,40,45,50,55 * * * * /home/pi/tanken.sh | tee -a /home/pi/tanken.log

TZ=Europe/Berlin
export TZ
t=`date  +%Y%m%d:%H:%M`
holePreise(){
    name=$1
    url=$2
    printf "$t $name "
    curl -s  $url | fgrep "current-price" | awk -F">" ' { print substr($2,1,4) } ' | xargs echo " "
}
holePreise 'Brinkschulte_Monheim' https://www.clever-tanken.de/tankstelle_details/43461
#holePreise 'SB_KrischerStrasse55' https://www.clever-tanken.de/tankstelle_details/32862
holePreise 'Shell_Opladener_str '  https://www.clever-tanken.de/tankstelle_details/5282
holePreise 'SB_KoelnerLand_350  '  https://www.clever-tanken.de/tankstelle_details/52720
holePreise 'PM_KoelnerLand_255  '  https://www.clever-tanken.de/tankstelle_details/145240 15269
holePreise 'Shell_KoelnerLand_77'  https://www.clever-tanken.de/tankstelle_details/45807
holePreise 'Esso_Ross_Str_86_DUS'  https://www.clever-tanken.de/tankstelle_details/8913
