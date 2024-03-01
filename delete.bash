#!/bin/bash

read -p "Enter a department code and course number: " dept_code course_num

deletefile=./data/${dept_code^^}$course_num.crs
	#if [ $(find ./data - name "{$dept_code^^}$course_num.crs") ] ; then
	#rm
if [ ! -f "$deletefile" ] ; then
	echo ERROR: course not found
	exit 1
fi



	now=$(date)
{
read bloop
read course_name
} < "$deletefile"
	echo "[$now]" DELETED: "$dept_code" "$course_num" "$course_name" >> ./data/queries.log
	echo course number was successfully deleted.
# < "$deletefile"
rm "$deletefile"
#echo bloop
exit 1


#IFS= read -r -p "Department Name: " dept_name
#echo "$dept_name"
#$dept_name >> "$filename"
