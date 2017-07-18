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
	local interval=2
	local period=1
	while true
	do
		grep "$input" $filename 2>/dev/null
		ret=$?
		if [ $ret -ne 0 ] ;then
			sleep $interval
			echo -e "\rWaiting $input occurs in $filename, check 1 minute later... [passed minutes: $period]\c"
			period=`expr $period + 1`
		else
			echo -e "\n$input occurs in $filename"
			return 0
		fi
	done
}

