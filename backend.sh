log_file=/tmp/expens.log
colour="\e[33m"

echo -e "${colour} disable the nodejs \e[0m"
dnf module disable nodejs -y &>>$log_file
echo $?

echo -e "${colour} enable the nodejs \e[0m"
dnf module enable nodejs:18 -y &>>$log_file
echo $?

echo -e "${colour} install the nodejs \e[0m"
dnf install nodejs -y &>>$log_file
echo $?

echo -e "${colour} copy the backend.service \e[0m"
cp backend.service /etc/systemd/system/backend.service &>>$log_file
echo $?

echo -e "${colour} Adding expense user \e[0m"
useradd expense &>>$log_file
echo $?

echo -e "${colour} creating the application directory \e[0m"
mkdir /app &>>$log_file
echo $?

echo -e "${colour} creating the application directory \e[0m"
rm -rf /app/* &>>$log_file
echo $?

echo -e "${colour} downloading the backend application \e[0m"
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip &>>$log_file
echo $?

echo -e "${colour} moving to the application \e[0m"
cd /app &>>$log_file
echo $?

echo -e "${colour} unzipping the backend \e[0m"
unzip /tmp/backend.zip &>>$log_file
echo $?

echo -e "${colour} moving to the directory \e[0m"
cd /app &>>$log_file
echo $?

echo -e "${colour} installing the dependencies of nodejs \e[0m"
npm install &>>$log_file
echo $?

echo -e "${colour} reloading the system \e[0m"
systemctl daemon-reload &>>$log_file
echo $?

echo -e "${colour} enabling the backend \e[0m"
systemctl enable backend &>>$log_file
echo $?

echo -e "${colour} starting the backend \e[0m"
systemctl start backend &>>$log_file
echo $?

echo -e "${colour} installing the mysql client \e[0m"
dnf install mysql -y &>>$log_file
echo $?

echo -e "${colour} creating the schema \e[0m"
mysql -h mysql-dev.osdevops99.online -uroot -pExpenseApp@1 < /app/schema/backend.sql &>>$log_file
echo $?



