yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm 
yum -y install epel-release yum-utils
yum-config-manager --disable remi-php54
yum-config-manager --enable remi-php73
yum install wget -y 
