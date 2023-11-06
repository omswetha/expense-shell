log_file=/tmp/expens.log
colour="\e[33m"

echo -e "${colour} installing the nginx \e[0m"
dnf install nginx -y &>>$log_file

echo -e "${colour} enabling the nginx \e[0m"
systemctl enable nginx &>>$log_file

echo -e "${colour} starting the nginx \e[0m"
systemctl start nginx &>>$log_file

echo -e "${colour} copying the expense.conf file \[0m"
cp expense.conf /etc/nginx/default.d/expense.conf &>>$log_file

echo -e "${colour} removing the unwanted informatiom \e[0m"
rm -rf /usr/share/nginx/html/* &>>$log_file

echo -e "${colour} downloading the expense \e[0m"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip &>>log_file
echo -e "${colour} moving to the directory \e[0m"
cd /usr/share/nginx/html &>>$log_file

echo -e "${colour} unzipping the file \e[0m"
unzip /tmp/frontend.zip &>>$log_file









