log_file=/tmp/expens.log
colour="\e[33m"

echo -e "${colour} disable mysql default version \e[0m"
dnf module disable mysql -y &>>log_file
echo $?

echo -e "${colour} copying the mysql.repo \e[0m"
cp mysql.repo /etc/yum.repos.d/mysql.repo &>>log_file
echo $?

echo -e "${colour} installing the mysql \e[0m"
dnf install mysql-community-server -y &>>log_file
echo $?

echo -e "${colour} enable mysql \e[0m"
systemctl enable mysqld &>>log_file
echo $?

echo -e "${colour} start mysql \e[0m"
systemctl start mysqld &>>log_file
echo $?

echo -e "${colour} installing the nginx \e[0m"
mysql_secure_installation --set-root-pass ExpenseApp@1 &>>log_file
echo $?