#!/bin/bash

read -p "Enter a department code and course number: " dept_code course_num
#readfilename=./data/$dept_code$course_num.crs
findfilename=./data/${dept_code^^}$course_num.crs #filename=CS3424
	if [ ! -f "$findfilename" ] ; then
#if [[ "$dept_code" = "$dept_code1" && "$course_num" = "$course_num1" ]]
	echo ERROR: course not found
	exit 1
fi

{	##this bracket is to read in the data from the .crs file w the info
#this is the format in teh .crs file, so it must be outputted the same format
	read dept_code dept_name
	read course_name
	read course_sched course_start course_end
	read credit_hours
	read course_size
} < "$findfilename"

echo Course department: "$dept_code" "$dept_name" 
echo Course name: "$course_name"
echo Scheduled days: "$course_sched" $course_start $course_end
echo Credit hours: "$credit_hours"
echo Enrolled Students: "$course_size"

exit 1
