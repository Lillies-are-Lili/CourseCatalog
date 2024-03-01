#!/bin/bash

read -p "Department code: " usr_dept_code
read -p "Department name: " usr_dept_name
read -p "Course number: " usr_course_num
read -p "Course name: " usr_course_name
read -p "Course schedule: " usr_course_sched
read -p "Course start date: " usr_course_start
read -p "Course end date: " usr_course_end
read -p "Credit hours: " usr_credit_hours
read -p "Enrolled Students: " usr_course_size

updatefilename=./data/${usr_dept_code^^}$usr_course_num.crs

if [ ! -f "$updatefilename" ] ; then
        echo ERROR: course not found
        exit 1
fi
filename=./data/${usr_dept_code^^}$usr_course_num.crs
{       ##this bracket is to read in the data from the .crs file w the info
#this is the format in teh .crs file, so it must be outputted the same format
        read dept_code dept_name
        read course_name
        read course_sched course_start course_end
        read credit_hours
        read course_size
} < "$filename"

if [ -z "$usr_dept_code" ] ; then 
usr_dept_code="$dept_code"
fi

if [ -z "$usr_dept_name" ] ; then 
        usr_dept_name="$dept_name"
fi

if [ -z "$usr_course_num" ] ; then 
        usr_course_num="$course_num"
fi

if [ -z "$usr_course_name" ] ; then 
        usr_course_name="$course_name"
fi

if [ -z "$usr_course_sched" ] ; then	
        usr_course_sched="$course_sched"
fi

if [ -z "$usr_course_start" ] ; then
        usr_course_start="$course_start"
fi

if [ -z "$usr_course_end" ] ; then
        usr_course_end="$course_end"
fi

if [ -z "$usr_credit_hours" ] ; then
        usr_credit_hours="$credit_hours"
fi

if [ -z "$usr_course_size" ] ; then
        usr_course_size="$course_size"
fi

echo "$usr_dept_code" "$usr_dept_name" > "$updatefilename"
echo "$usr_course_num" >> "$updatefilename"
echo "$usr_course_sched" "$usr_course_start" "$usr_course_end" >> "$updatefilename"
echo "$usr_credit_hours" >> "$updatefilename"
echo "$usr_course_size" >> "$updatefilename"

now=$(date)
echo "[$now]" UPDATED: "$dept_code" "$course_num" "$course_name" >> ./data/queries.log

exit 1

