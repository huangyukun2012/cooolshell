#!/bin/bash
function sh_duration()
{
	#para1:start date
	#para2:end date
	local from=$1
	local to=$2
	local start_date_by_sec=`date -d "${from}" +%s`
	local end_date_by_sec=`date -d "${to}" +%s`

	local stampdiff=`expr $end_date_by_sec - $start_date_by_sec`
	local duration_min=`expr $stampdiff / 60`
	echo $duration_min
	return 0
}


function sh_wait()
{
	local input=$1
	local filename=$2
	local interval=10
	while true
	do
		set -x
		grep "$input" $filename 2>&1 >/dev/null
		ret=$?
		if [ $ret -ne 0 ] ;then
			sleep $interval
		else
			echo "$input occurs in $filename"
			return 0
		fi
	done
}



