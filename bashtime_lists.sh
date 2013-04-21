#!/bin/bash

# if no args
if [[ -z "$*" ]] ; then
    # get the date as "hours(12) minutes" in a single call
    # make a bash array with it
    d=( $(date "+%I %M") )
    # separate hours and minutes
    hour=${d[0]#0} # remove leading 0 or values <10 will be interpreted as octal
    min=${d[1]#0}
else
    # get the arguments passed to the script
    hour=${1#0}
    min=${2#0}
fi

plain=(🕐 🕑 🕒 🕓 🕔 🕕 🕖 🕗 🕘 🕙 🕚 🕛 )
half=(🕜 🕝 🕞 🕟 🕠 🕡 🕢 🕣 🕤 🕥 🕦 🕧 )

# array index starts at 0
hi=$((hour-1))

if [[ $min -lt 15 ]] ; then
    echo -n ${plain[$hi]}
elif [[ $min -lt 45 ]] ; then
    echo -n ${half[$hi]}
else
    echo -n ${plain[$((hi+1))]}
fi
