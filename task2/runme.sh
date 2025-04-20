#!/bin/bash

rm ./myfile.lck 2>>/dev/null
rm ./result.txt 2>>/dev/null
rm ./myfile 2>>/dev/null
rm ./nohup.out 2>>/dev/null

list_pid=();
touch myfile

for i in {1..10}
do
    nohup ./main myfile 2>/dev/null &
    pid=$!
    list_pid+=("$pid")
done

touch result.txt

sleep 300


for pid in "${list_pid[@]}"
do
    kill -2 "$pid" 2>>/dev/null
done 

rm ./nohup.out
echo "All tasks completed"