groupadd shared
useradd -G shared -m -p "" user1
useradd -G shared -m -p "" user2
mkdir /shared_files
touch /shared_files/shared_file
chgrp -R shared /shared_files
chown -R user1 /shared_files
chmod -R u+rw,g+rw,o-rwx /shared_files
rm -r /shared_files
userdel -r user1
userdel -r user2
groupdel shared
