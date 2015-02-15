function clock() {
  if [ $# -lt 1 ] ; then
    # Handle no argument call (default), use current time
    clock `date +'%I %M'`
  elif [ $# -lt 2 ] ; then
    # Handle single argument: "4:30". Don't match single argument
    # without ":"
    if [[ $1 == *:* ]] ; then
      clock `echo $1 | tr ":" " "`
    else
      echo "$FUNCNAME: invalid time $1"
      return 1
    fi
  elif [[ "$1:$2" == "24:00" ]] ; then
    # Special case for 24:00 - it is a valid time.
    clock 12 00
  else
    # Normal usage: two arguments, minutes and seconds.
    if [ $1 -gt 23 ] || [ $2 -gt 59 ]; then
      echo "$FUNCNAME: invalid time '$1:$2'"
      return 1
    fi

    # Because of the way the unicode clock symbols work,
    # we need to offset the character code according to
    # the number of minutes:
    #
    #     0 - 15 : don't offset it
    #    16 - 45 : offset it by 12 (current half-hour)
    #    46 - 59 : offset it by 1 (next hour)
    #
    # Basically, it goes 1:00, 2:00, ... 12:00, 1:30, 2:30, ...
    if [ $2 -gt 44 ] ; then
      OFFSET=1
    elif [ $2 -gt 14 ] ; then
      OFFSET=12
    else
      OFFSET=0
    fi

    # This is where it gets a bit tricky. Hour values that
    # are greater than 12 need to be handled, but we can't just
    # use modulo math (because 12 comes at the end).
    if [ $1 -gt 12 ] ; then
      OFFSET=`expr $OFFSET - 12`
    elif [ $1 -gt 11 ] && [ $OFFSET -eq 1 ] ; then
      OFFSET=-11
    fi

    # Now, we start with the first 3 bytes of the clock emoji.
    BASE='\xf0\x9f\x95'
    # Calculate the last byte based on the offset.
    INT=`expr $1 % 24 + 143 + $OFFSET`
    HEX=\\x$(printf "%x" $INT)
    echo -e $BASE$HEX
    # If we need to debug it, this line is useful
    # echo "$1:$2 ($INT) [$BASE$HEX]"
  fi
}

clock $*