#! /bin/bash

# This is bashtime.sh
# Copyright (c) 2013 Paul Scott-Murphy

# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
# the Software, and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
# FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
# IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# if no args
if [[ -z "$*" ]] ; then
    # get the date as "hours(12) minutes" in a single call
    # make a bash array with it
    time=$(date "+%I%M")
else
    # get the arguments passed to the script
    hour=${1}
    min=${2}
    time="$hour$min"
fi

if [ "$time" -lt 115 ]
then
    echo -n '🕐'
elif [ "$time" -lt 145 ]
then
    echo -n '🕜'
elif [ "$time" -lt 215 ]
then
    echo -n '🕑'
elif [ "$time" -lt 245 ]
then
    echo -n '🕝'
elif [ "$time" -lt 315 ]
then
    echo -n '🕒'
elif [ "$time" -lt 345 ]
then
    echo -n '🕞'
elif [ "$time" -lt 415 ]
then
    echo -n '🕓'
elif [ "$time" -lt 445 ]
then
    echo -n '🕟'
elif [ "$time" -lt 515 ]
then
    echo -n '🕔'
elif [ "$time" -lt 545 ]
then
    echo -n '🕠'
elif [ "$time" -lt 615 ]
then
    echo -n '🕕'
elif [ "$time" -lt 645 ]
then
    echo -n '🕡'
elif [ "$time" -lt 715 ]
then
    echo -n '🕖'
elif [ "$time" -lt 745 ]
then
    echo -n '🕢'
elif [ "$time" -lt 815 ]
then
    echo -n '🕗'
elif [ "$time" -lt 845 ]
then
    echo -n '🕣'
elif [ "$time" -lt 915 ]
then
    echo -n '🕘'
elif [ "$time" -lt 945 ]
then
    echo -n '🕤'
elif [ "$time" -lt 1015 ]
then
    echo -n '🕙'
elif [ "$time" -lt 1045 ]
then
    echo -n '🕥'
elif [ "$time" -lt 1115 ]
then
    echo -n '🕚'
elif [ "$time" -lt 1145 ]
then
    echo -n '🕦'
elif [ "$time" -lt 1215 ]
then
    echo -n '🕛'
elif [ "$time" -lt 1300 ]
then
    echo -n '🕛'
else
    echo -n '⭕'
fi
