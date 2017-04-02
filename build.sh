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


echo "Check ssh-copy-id command"
echo "kill zabbix agent on $1 machine"
echo "Start playbook"

#ansible-playbook  --extra-vars="target=$1" example2.yml -vvv
ansible-playbook  --extra-vars="target=$1" example3.yml -vvv

cp logfile $1.log
