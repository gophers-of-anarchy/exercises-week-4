groupadd shared
useradd -g shared -d /home/user1 -M -s /bin/bash user1
useradd -g shared -d /home/user2 -M -s /bin/bash user2
mkdir /shared_files
touch /shared_files/shared_file
chown user1:shared /shared_files /shared_files/shared_file
chmod 660 /shared_files/shared_file
userdel -r user1
userdel -r user2
groupdel shared