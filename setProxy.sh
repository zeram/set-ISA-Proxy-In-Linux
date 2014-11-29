#!/bin/bash
# proxy setup start -------------------

#http://www.fedoraforum.org/forum/printthread.php?t=742


proxy_string=""

function proxy(){
echo -n "username:"
read -e username
echo -n "password:"
read -es password
export http_proxy="http://$username:$password@proxy: port/"
export https_proxy="http://$username:$password@proxy: port/"
export ftp_proxy="http://$username:$password@proxy: port/"
}

#http://wiki.bash-hackers.org/syntax/quoting
#http://forums.fedoraforum.org/showthread.php?t=225470

proxy_string="function proxy(){ \n"
proxy_string=$proxy_string"ds=\"\\\\\\\" \n"
proxy_string=$proxy_string"echo -n \"username:\" \n"
proxy_string=$proxy_string"read -e username \n"
proxy_string=$proxy_string"echo -n \"password:\" \n"
proxy_string=$proxy_string"read -es password \n"

proxy_string=$proxy_string"export http_proxy=\"http://[AUTHDOMAINHERE]\$ds"
proxy_string=$proxy_string"\$username:\$password@[ENTERYOURPTOXYIPHERE]:8080/\" \n"

proxy_string=$proxy_string"export https_proxy=\"http://[AUTHDOMAINHERE]\$ds"
proxy_string=$proxy_string"\$username:\$password@[ENTERYOURPTOXYIPHERE]:8080/\" \n"

proxy_string=$proxy_string"export ftp_proxy=\"http://[AUTHDOMAINHERE]\$ds"
proxy_string=$proxy_string"\$username:\$password@[ENTERYOURPTOXYIPHERE]:8080/\" \n}"



echo -e $proxy_string
echo -e $proxy_string > set_proxy.txt



#http://blog.mypapit.net/2006/02/how-to-use-apt-get-behind-proxy-server-ubuntudebian.html
#Edit your /etc/bash.bashrc file as root.
#Put these line at the end of your /etc/bash.bashrc file :


if grep -q "ftp_proxy" "/etc/bashrc" ; then
    echo "Found"
else
    echo "Not found"
    #cp /etc/bashrc /etc/bashrc.backup
    echo -e $proxy_string >> /etc/bashrc
fi


# proxy setup end _____________________
