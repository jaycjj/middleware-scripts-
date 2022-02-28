#!/bin/bash

# Description: Installation and Configuration of SonarQube on CentOS7
# Author: Jallah Cordor
# Date: Feb. 27, 2022

echo "SonarQube installation is in progress,this might take a while. Please be patient........"
echo
sleep 2

su - vagrant

echo "Java 11 is installing........"
sleep 2
echo
sudo yum install net-tools -y
sudo yum update -y
sudo yum install java-11-openjdk-devel -y
sudo yum install java-11-openjdk -y
echo

echo "Downloading the latest versions of SonarQube......."
sleep 2
echo

cd /opt
echo

sudo yum install wget -y
echo

sudo wgethttps://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip
echo

echo "Extracting packages......"
sleep 2
echo

sudo yum install zip -y
echo

sudo unzip /opt/sonarqube-9.3.0.51899.zip
echo

sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899

cd /opt/sonarqube-9.3.0.51899/bin/linux-x86-64

./sonar.sh start
echo
sleep 2

# NB: If you are not able to connect from the browser,it means some server has firewall enabled, then you might want to open the port 9000 with this command:

sudo firewall-cmd --permanent --add-port=9000/tcp
echo

echo "SonarQube installation successfully  completed....."
echo

echo "Connect to the SonarQube server through the browser using the link."
echo
echo "http://192.168.56.33:9000"
echo
