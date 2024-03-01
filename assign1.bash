#!/bin/bash
# assign1 script
while 
echo "Enter one of the following actions or press CTRL-D to exit."
echo C - create a new course record
echo R - read an existing course record
echo U - update an existing course record
echo D - delete an existing course record
echo E - update enrolled student count of existing course
echo T - show total course count
read action
do

if [[ $action == "C" || $action == "c" ]] ; then ./create.bash
fi

if [[ $action == "R" || $action == "r" ]] ; then ./read.bash
fi

if [[ $action == "U" || $action == "u" ]] ; then ./update.bash
fi

if [[ $action == "D" || $action == "d" ]] ; then ./delete.bash
fi

if [[ $action == "E" || $action == "e" ]] ; then ./enroll.bash
fi

if [[ $action == "T" || $action == "t" ]] ; then ./total.bash
fi

if [[ $action =~ [^'CRUDETcrudet'] ]] ; then echo ERROR: Invalid option
fi

done
