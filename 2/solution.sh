#!/bin/bash


groupadd shared

useradd -G shared -m -p "" user1
useradd -G shared -m -p "" user2
passwd user1
passwd user2

mkdir /shared_files
touch /shared_files/shared_file
chown :shared /shared_files
chmod 760 /shared_files

groupdel shared
userdel -r user1
userdel -r user2

rm /shared_files/shared_file
rmdir /shared_files