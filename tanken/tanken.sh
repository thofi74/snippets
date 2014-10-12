#!/bin/sh
TZ=Europe/Berlin
export TZ
t=`date  +%Y%m%d:%H:%M`
holePreise(){
    name=$1
    url=$2
    printf "$t $name "
    curl $url | fgrep "init(" | awk -F"'" ' { print $2 } ' | xargs echo " "
}
holePreise 'Brinkschulte_Monheim' http://www.clever-tanken.de/tankstelle_details/43461
holePreise 'SB_KrischerStrasse55' http://www.clever-tanken.de/tankstelle_details/32862
holePreise 'Shell_Opladener_str '  http://www.clever-tanken.de/tankstelle_details/5282
holePreise 'SB_KoelnerLand_350  '  http://www.clever-tanken.de/tankstelle_details/52720
holePreise 'PM_KoelnerLand_255  '  http://www.clever-tanken.de/tankstelle_details/15269
holePreise 'Shell_KoelnerLand_77'  http://www.clever-tanken.de/tankstelle_details/45807
holePreise 'Esso_Ross_Str_86_DUS'  http://www.clever-tanken.de/tankstelle_details/8913
