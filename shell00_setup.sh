#!/bin/sh
set -e
mkdir -p ex00
printf 'Z\n' > ex00/z

mkdir -p ex01
printf '' > ex01/testShell00
truncate -size=40 ex01/testShell00
chmod 455 ex01/testShell00
touch -t 06012342 ex01/testShell00

mkdir -p ex02
mkdir -p ex02/test0 ex02/test2

printf '1234' > ex02/test1
printf 'a' > ex02/test3
ln -f ex02/test3 ex02/test5
printf 'ab' > ex02/test4
ln -sfn test0 ex02/test6

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

ssh-keygen -t rsa
#/home/db/.ssh/id_rsa
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