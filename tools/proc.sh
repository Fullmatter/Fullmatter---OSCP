#!/bin/bash
#cuando no tenemos un crontab y no podemos ver las tareas que se ejecutan desde un gestor
#con esto sacamos las tareas en terminal que se está ejecutando tanto entrada como salida

function ctrl_c(){
    echo -e "\n[!]Stopping proc.sh......."
    exit 1
}

trap ctrl_c INT

old_process=$(ps -eo command)

while true; do
    new_process=$(ps -eo command)
    diff <(echo "${old_process}") <(echo "${new_process}") | grep "[\>\<]" | grep -v -E "command|proc"
    old_process=$new_process
done