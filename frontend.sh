
echo -e "\e[36m installing the nginx \e[0m"
dnf install nginx -y

echo -e "\e[36m enabling the nginx \e[0m"
systemctl enable nginx

echo -e "\e[36m starting the nginx \e[0m"
systemctl start nginx

echo -e "\e[36m copying the expense.conf file \[0m"
cp expense.conf /etc/nginx/default.d/expense.conf

echo -e "\e[36m removing the unwanted informatiom \e[0m"
rm -rf /usr/share/nginx/html/*

echo -e "\e[36m downloading the expense \e[0m"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip

echo -e "\e[36m moving to the directory \e[0m"
cd /usr/share/nginx/html

echo -e "\e[36m unzipping the file \e[0m"
unzip /tmp/frontend.zip









