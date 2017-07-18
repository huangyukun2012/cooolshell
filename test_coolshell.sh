#!/bin/bash
source ./coolshell.sh

function test_sh_duration()
{
	local from="2017-09-09 09:09:09"
	local to="2017-09-09 09:19:09"
	local duration=`sh_duration "$from" "$to"`
	echo $duration
}

ret=`test_sh_duration`
if [ $ret -eq 10 ];then
	echo "[PASSED] test_sh_duration."
fi
