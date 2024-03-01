#!/bin/bash

read -p "Department code: " dept_code
read -p "Department name: " dept_name
read -p "Course number: " course_num
read -p "Course name: " course_name
read -p "Course schedule: " course_sched
read -p "Course start date: " course_start
read -p "Course end date: " course_end
read -p "Credit hours: " credit_hours
read -p "Enrolled Students: " course_size
 
createfilename=./data/${dept_code^^}$course_num.crs

if [ -f "$createfilename" ] ; then
	echo ERROR: course already exists
	exit 1
fi
# touch $createfilename
#echo "Department Code: "
#	if [[ "$dept_code" =~ [^'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'] || ${#dept_code} > 3 ]] ; then
#		 echo Not a valid department code. >&2
#exit 1
	# put return here so it can return to main menu		
#	fi
echo $dept_code $dept_name > "$createfilename"
#$dept_code > "$filename"

#IFS= read -r -p "Department Name: " dept_name
#echo "$dept_name"
#$dept_name >> "$filename"

#echo -n "Course Number: "
#read course_num
#	if [[ "$course_num" =~ [^0-9] || ${#course_num} > 4  ]] ; then
#		echo Not a valid course number. >&2
	#put a return here so it can return to main menu
#exit 1

#echo "$course_num"
#$course_num >> "$filename"

#IFS= read -r -p "Course Name: " course_name
#echo "$course_name"
echo $course_name >> "$createfilename"

#echo -n "Course Schedule: "
#read course_sched
#	if [[ "$course_sched" != "MWF" || "${course_sched}" != "TH" ]] ; then
#		echo Not a valid course schedule. >&2
	#put a return here
#	fi
#echo "$course_sched"
echo $course_sched $course_start $course_end >> "$createfilename"

#IFS= read -r -p "Course start date: " course_start
#echo "$course_start"
#$course_start >> "$filename"

#IFS= read -r -p "Course end date: " course_end
#echo "$course_end"
#$course_end >> "$filename"

#echo -n "Course credit hours: "
#read course_hours
#	if [[ "$course_hours" < 0 || "$course_hours" =~ [^0-9] ]] ; then
#	echo Not a valid course credit hour. >&2
	#put a return
#exit 1
#	fi
#echo "$course_hours"
echo $credit_hours >> "$createfilename"

#echo -n "Initial course enrollment: "
#read course_size
#	if [[ "$course_size" < 0 || "$course_size" =~ [^0-9] ]] ; then
#	echo Not a valid initial course size. >&2
	# put a reutrn
#exit 1
#	fi
#echo "$course_size"
#remember to delete the above line when code is corrrect
echo $course_size >> "$createfilename"

#if [[ $(find ./data -name "{$dept_code^^}$course_num.crs") ]] ; then
#update data/queries.log...????
#echo ERROR: course already exists
#else
now=$(date)
echo "[$now]" CREATED: "$dept_code" "$course_num" "$course_name" >> ./data/queries.log
#fi

exit 1
