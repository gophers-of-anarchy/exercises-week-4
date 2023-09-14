#!/bin/bash

groupadd shared

useradd -G shared -m -p "" user1
useradd -G shared -m -p "" user2


mkdir /shared_files
touch /shared_files/shared_file


chown user1 /shared_files/shared_file
chmod g+rw /shared_files

deluser --remove-home user1
deluser --remove-home user2

groupdel shared

rm -r /shared_files