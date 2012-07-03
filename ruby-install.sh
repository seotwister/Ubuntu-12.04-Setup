#!/bin/sh
# A simple Script for installing Rails on Ubuntu 12.04 LTS
# It will also install the dependencies required as well as the RVM
# Author: Bob Orchard (me@boborchard.com),(http://www.boborchard.com)
# License: GNU General Public License (GPL) version 3

RUBY_VERSION="1.9.3"
LOG_FILE="$HOME/install.log"

echo "Web Server Installer Initialized"

echo "// Updating package cache"
sudo apt-get update >>$LOG_FILE
echo "// Done"

echo "// Installing mysql-server"
apt-get -y install mysql-server >>$LOG_FILE
echo "// Done"

echo "// Installing mysql-common"
sudo apt-get -y install mysql-common >>$LOG_FILE
echo "// Done"

echo "// Installing php5"
sudo apt-get -y install php5 >>$LOG_FILE
echo "// Done"

echo "// Installing libapache2-mod-php5"
sudo apt-get -y install libapache2-mod- >>$LOG_FILE
echo "// Done"

echo "// Installing php5-cgi"
sudo apt-get -y install php5-cgi >>$LOG_FILE
echo "// Done"

echo "// Installing php5-cli"
sudo apt-get -y install php5-cli >>$LOG_FILE
echo "// Done"

echo "// Installing php5-common"
sudo apt-get -y install php5-common >>$LOG_FILE
echo "// Done"

echo "// Installing php5-curl"
sudo apt-get -y install php5-curl >>$LOG_FILE
echo "// Done"

echo "// Installing php5-gd"
sudo apt-get -y install php5-gd >>$LOG_FILE
echo "// Done"

echo "// Installing php5-mysql"
sudo apt-get -y install php5-mysql >>$LOG_FILE
echo "// Done"

echo "// Installing php5-pgsql"
sudo apt-get -y install php5-pgsql >>$LOG_FILE
echo "// Done"

echo "// Installing php5-mcrypt"
sudo apt-get -y install php5-mcrypt >>$LOG_FILE
echo "// Done"

echo "// Installing libmysqlclient15-dev"
sudo apt-get -y install libmysqlclient15-dev >>$LOG_FILE
echo "// Done"

echo "// Installing postfix"
sudo apt-get -y install postfix >>$LOG_FILE
echo "// Done"

echo "// Installing php-pear"
sudo apt-get -y install php-pear >>$LOG_FILE
echo "// Done"

echo "// Installing libio-socket-ssl-perl"
sudo apt-get -y install libio-socket-ssl-perl >>$LOG_FILE
echo "// Done"

echo "// Installing libcrypt-ssleay-perl"
sudo apt-get -y install libcrypt-ssleay-perl >>$LOG_FILE
echo "// Done"

echo "// Installing libnet-libidn-perl"
sudo apt-get -y install libnet-libidn-perl >>$LOG_FILE
echo "// Done"

echo "// Installing libio-socket-inet6-perl"
sudo apt-get -y install libio-socket-inet6-perl >>$LOG_FILE
echo "// Done"

echo "// Installing libsocket6-perl"
sudo apt-get -y install libsocket6-perl >>$LOG_FILE
echo "// Done"

echo "// Installing apache2-mpm-itk"
sudo apt-get -y install apache2-mpm-itk >>$LOG_FILE
echo "// Done"

echo "// Installing vsftpd"
sudo apt-get -y install vsftpd >>$LOG_FILE
echo "// Done"

echo "// Installing db-util"
sudo apt-get -y install db-util >>$LOG_FILE
echo "// Done"

echo "// Installing libapache2-mod-bw"
sudo apt-get -y install libapache2-mod-bw >>$LOG_FILE
echo "// Done"

echo "// Installing php5-imap"
sudo apt-get -y install php5-imap >>$LOG_FILE
echo "// Done"

echo "// Installing libapache2-mod-suphp"
sudo apt-get -y install libapache2-mod-suphp >>$LOG_FILE
echo "// Done"

echo "// Installing libapache2-request-perl"
sudo apt-get -y install libapache2-request-perl >>$LOG_FILE
echo "// Done"

echo "// Installing libapreq2"
sudo apt-get -y install libapreq2 >>$LOG_FILE
echo "// Done"

echo "// Installing libapache2-mod-qos"
sudo apt-get -y install libapache2-mod-qos >>$LOG_FILE
echo "// Done"

echo "// Installing libapache2-mod-evasive"
sudo apt-get -y install libapache2-mod-evasive >>$LOG_FILE
echo "// Done"

echo "// Installing libapache-mod-security"
sudo apt-get -y install libapache-mod-security >>$LOG_FILE
echo "// Done"

echo "// Installing postfix"
sudo apt-get -y install postfix >>$LOG_FILE
echo "// Done"

echo "// Installing mailutils"
sudo apt-get -y install mailutils >>$LOG_FILE
echo "// Done"

echo "// Installing sgt-puzzles"
sudo apt-get -y install sgt-puzzles >>$LOG_FILE
echo "// Done"

echo "// Installing php5-tidy"
sudo apt-get -y install php5-tidy >>$LOG_FILE
echo "// Done"

echo "// Installing php5-snmp"
sudo apt-get -y install php5-snmp >>$LOG_FILE
echo "// Done"

echo "// Installing libxml2-dev"
sudo apt-get -y install libxml2-dev >>$LOG_FILE
echo "// Done"

echo "// Installing libpam-pwdfile"
sudo apt-get -y install libpam-pwdfile >>$LOG_FILE
echo "// Done"

echo "// Installing  git"
sudo apt-get -y install git >>$LOG_FILE
echo "// Done"

echo "// Installing  cURl"
sudo apt-get -y install curl >>$LOG_FILE
echo "// Done"

echo "// Starting Pear Installs"
pear install Net_SMTP
pear install Auth_SASL
pear install mail
pear install mail_mime
echo "// Done"

echo "// Download libxml2"
aptitude download libxml2
echo "// Extract Files for Install"
ar -xf libxml2_2.7.8.dfsg-5.1ubuntu4_amd64.deb
echo "// Remove Install Files"
rm libxml2_2.7.8.dfsg-5.1ubuntu4_amd64.deb control.tar.gz
echo "// Extract libxml2"
tar xf data.tar.gz
echo "// Switch to install directory"
cd usr/lib/x86_64-linux-gnu/
echo "// Move files to new location"
mv * /usr/lib/x86_64-linux-gnu/
echo "Copy Files"
cp /usr/lib/x86_64-linux-gnu/libxml2.so.2* /usr/lib/
echo "// Done"


echo "// Enable Mods"
a2enmod bw
a2enmod env
a2enmod expires
a2enmod asis
a2enmod authn_default
a2enmod headers
a2enmod rewrite
a2enmod ssl
a2enmod imagemap
a2enmod suphp
a2enmod proxy
a2enmod version
a2enmod unique_id
a2enmod qos
a2enmod perl
echo "// Done"

echo "// Make Site(s) directory"
mkdir /home/sites/
echo "// Done"

echo "// Set Ownership"
chown www-data:www-data -R /home/sites/
echo "// Done"

echo "// Set Permissions"
chmod 0755 /home/sites/
echo "// Done"

echo "// Restart apache2ctl"
apache2ctl restart
echo "// Done"

echo ""
ln -s /lib/*-linux-gnu/security/pam_userdb.so /lib/security/pam_userdb.so

echo "// Make Directories"
mkdir /etc/vsftpd/
mkdir /etc/vsftpd/user_conf


echo "// Edit/change Files according to readme"
vi /etc/apache2/httpd.conf
vi /etc/php5/apache2/php.ini
vi /etc/vsftpd.conf
vi /etc/vsftpd/updatepass.sh
vi /etc/vsftpd/vsftpd.passwd.raw
vi /etc/vsftpd/user_conf/webmaster
vi /etc/mysql/my.cnf
echo "// Done Editing"

# Install RVM (Ruby Version Manager)
echo "// Installing RVM"
curl -L get.rvm.io | bash -s stable >>$LOG_FILE

# fallback for the above command (in case of certificates errors)
#if ($? !=0)
# then
#  curl -kL get.rvm.io | bash -s stable
#fi  

echo "// DONE"
echo "// Loading RVM"
source ~/.rvm/scripts/rvm >>$LOG_FILE
echo "// Done"

# Install Additional Dependencies
sudo apt-get -y install build-essential openssl libreadline6 libreadline6-dev zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion nodejs

# Install Latest version of Ruby
echo "// Installing Ruby v $RUBY_VERSION ..."
rvm install $RUBY_VERSION >>$LOG_FILE
echo "// Done"

echo "If you want to install another version of ruby e.g 1.8.7"
echo "Then use the command 'rvm install 1.8.7' "

# Select and Set latest version of ruby as the default so that
# You won't have to select each time you start a terminal

echo ".......Setting the default version of Ruby..."
rvm --default use $RUBY_VERSION >>$LOG_FILE
echo "// Done"

echo "Now, You are using Ruby $RUBY_VERSION by default"
echo "if you want to change that then use 'rvm --default <ruby_version>' "

# Install Latest version of Rails
echo "// Installing Rails gem"
gem install rails >>$LOG_FILE
echo "//Done"

echo "######################################"
echo "###### Installation Completed ########"
echo "######################################"

echo "if something went wrong then checkout the log file $LOG_FILE"