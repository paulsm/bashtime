#!/bin/bash

script=$1

if [[ "$2" == "debug" ]] ; then
    debug=1
fi

assert()
{
    local OK="\\033[1;32m"
    local NOK="\\033[1;31m"
    local RAZ="\\033[0;39m"

    local hour=$1
    local min=$2
    local match=$3

    local res=$(./$script $hour $min)

    if [[ "$res" == "$match" ]] ; then
        if [[ -n "$debug" ]] ; then
            printf "%s %s : ${OK}%s  ==${RAZ} %s\n" $hour $min $res $match
        fi
    else
        printf "%s %s : ${NOK}%s  !=${RAZ} %s\n" $hour $min $res $match
    fi
}

plain=(🕐 🕑 🕒 🕓 🕔 🕕 🕖 🕗 🕘 🕙 🕚 🕛 )
half=(🕜 🕝 🕞 🕟 🕠 🕡 🕢 🕣 🕤 🕥 🕦 🕧 )

for h in $(seq 1 11); do
    hour=$(printf "%02d" $h) # add a leading zero if necessary
    hi=$((h-1)) # array index starts at 0
    for m in $(seq 0 14); do
        min=$(printf "%02d" $m)
        assert $hour $min ${plain[hi]}
    done
    for min in $(seq 15 44); do
        assert $hour $min ${half[hi]}
    done
    for min in $(seq 45 59); do
        assert $hour $min ${plain[$((hi+1))]}
    done
done

