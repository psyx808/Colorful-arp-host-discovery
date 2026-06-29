scan () {
        g='\033[92m'
        c='\033[96m'
        y='\033[97m'
        r='\033[0m'
        arp-scan --localnet --resolve --ignoredups --plain \
                -F '${name}\t${ip}\t${mac}\t${vendor}' \
                | awk -F '\t' -v g="$g" -v c="$c" -v y="$y" -v r="$r" \
                        '!seen[$2 SUBSEP $3]++ {print g $1 r " ==> " y $2 r " " c $3 r " " $4}'
}
