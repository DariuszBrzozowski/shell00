#!/bin/sh
set -e
mkdir -p .archive

mkdir -p ex00
echo 'Z' > ex00/z

mkdir -p ex01

printf '' > ex01/testShell00
truncate -s 40 ex01/testShell00
chmod 455 ex01/testShell00
touch -t 06012342 ex01/testShell00
tar -cf ex01/testShell00.tar ex01/testShell00
mv ex01/testShell00 .archive

mkdir -p ex02/test{0,2}
touch ex02/test{1,3,4}
ln ex02/test3 ex02/test5
ln -s test0 ex02/test6

truncate -s 4 ex02/test1
truncate -s 1 ex02/test3
truncate -s 2 ex02/test4

#change mod ugo (rwx)
chmod 715 ex02/test0
chmod 714 ex02/test1
chmod 504 ex02/test2
chmod 404 ex02/test3 ex02/test5
chmod 641 ex02/test4

touch -t 06012047 ex02/test0
touch -t 06012146 ex02/test1
touch -t 06012245 ex02/test2
touch -t 06012344 ex02/test3 ex02/test5
touch -t 06012343 ex02/test4
touch -h -t 06012220 ex02/test6
cd ex02
tar -cf exo2.tar *
cd ..

rm -rf ex02/test0
rm -rf ex02/test1
rm -rf ex02/test2
rm -rf ex02/test3 ex02/test5
rm -rf ex02/test4
rm -rf ex02/test6

ssh-keygen
mkdir -p ex03
mv /home/db/.ssh/id_rsa.pub ex03/id_rsa_pub
cat ex03/id_rsa_pub

mkdir -p ex04
touch ex04/midLS
echo "ls -tmp">ex04/midLS

mkdir -p ex05
touch ex05/git_commit.sh
echo "git log -5 --format=%H" > ex05/git_commit.sh
chmod +x ex05/git_commit.sh