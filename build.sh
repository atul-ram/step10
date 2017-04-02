#!/usr/bin/env bash
set -o errexit
set -o nounset
# set -o xtrace
set -o pipefail

__DIR__="$(cd "$(dirname "${0}")"; echo $(pwd))"
__BASE__="$(basename "${0}")"
__FILE__="${__DIR__}/${__BASE__}"

echo "################################"
echo "Build Information"
echo "Directory: ${__DIR__}"
echo "Filename: ${__FILE__}"
>logfile
echo "################################"


echo "doing pre-work ...."
sshpass -f pass.txt  ssh-copy-id -i ~/.ssh/id_rsa.pub sshadmin@$1

echo "kill zabbix agent on $1 machine (if any)"
ssh sshadmin@$1  "pid=\$(ps aux | grep 'zabbix' | awk '{print \$2}' | head -1); echo \$pid |xargs kill -9"

echo "Start playbook"

#ansible-playbook  --extra-vars="target=$1" example3.yml -vvv

cp logfile $1.log
tail -1 logfile >>summary.log
