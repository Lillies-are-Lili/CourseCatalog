#!/bin/bash


read -p "Enter a course department code and number: " dept_code course_num

updatestudents=./data/${dept_code^^}$course_num.crs
	if [ ! -f "$updatestudents" ] ; then
	echo ERROR: course not found
	exit 1
fi
read -p "Enter an enrollment change amount: " newstudent
#if [[ "$newstudent" =~ [^0-9] || "$newstudent" =~ {^-1,-2,-3,-4,-5,-6,-7,-8,-9} ]] ; then
#	echo Not an signed integer. >&2
#	exit 1
#fi
filename=./data/${dept_code^^}$course_num.crs
{
read dept_code dept_name
read course_name
read course_sched course_start course_end
read credit_hours
read course_size
#sed -i "s/$course_size/$course_size1/g" $updatestudents
} < "$filename"

course_size=$(($course_size + $newstudent))

echo $dept_code $dept_name > "$filename" 
echo $course_name >> "$filename"
echo $course_sched $course_start $course_end >> "$filename"
echo $credit_hours >> "$filename"
echo $course_size >> "$filename"

now=$(date)
echo "[$now]" ENROLLMENT: "$dept_code" "$course_num" "$course_name" >> ./data/queries.log
echo changed by: "$newstudent"

exit 1
