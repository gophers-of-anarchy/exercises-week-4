groupadd shared
useradd -G shared -m -p "" user1
useradd -G shared -m -p "" user2
mkdir /shared_files
touch /shared_files/shared_file
chgrp shared /shared_files
chgrp shared /shared_files/shared_file
chown user1 /shared_files
chown user1 /shared_files/shared_file
chmod 660 /shared_files/shared_file
chmod 660 /shared_files
rm /shared_files/shared_file
rmdir /shared_files/
userdel user1 -r
userdel user2 -r
groupdel shared