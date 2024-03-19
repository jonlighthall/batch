#!/bin/bash -u
bat_dir='../'
bat_file=flush_dns_admin.bat
if [ -f "${bat_dir}/${bat_file}" ]; then
	cmd.exe /c "cd ${bat_dir} &  ${bat_file}"
fi

hist_file=${HOME}/.bash_history
if [ -f $hist_file ]; then
    echo "#$(date +'%s') SHUTDN $(date +'%a %b %d %Y %R:%S %Z') from $(hostname -s)" >>$hist_file
fi
echo -n "connecting to powershell... "
powershell.exe 'Write-Output "done"; Write-Host "shutting down WSL..."'
powershell.exe -Command "wsl --shutdown"
