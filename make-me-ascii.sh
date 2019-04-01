#!/bin/bash
cat /etc/ssh/ssh_config|grep -v Banner >/tmp/.tmpssh;mv /tmp/.tmpssh /etc/ssh/ssh_config && echo "Banner /etc/sshgreeting" >> /etc/ssh/ssh_config
mkdir -p /scripts && chmod -R 777 /scripts
echo "#!/bin/bash" > /scripts/pullascii
echo "wget -qO - http://www.asciiartfarts.com/random.cgi | sed -n '/<pre>/,/<\/pre>/p' | sed -n '/<table*/,/<\/table>/p' | sed '1d' | sed '\$d' | recode html..ascii > /etc/sshgreeting" >> /scripts/pullascii
chmod +x /scripts/pullascii && cat /etc/crontab|grep -v pullascii > /tmp/.tmpcron;mv /tmp/.tmpcron /etc/crontab
echo "2 * * * * root /scripts/pullascii" >> /etc/crontab && service ssh restart
/scripts/pullascii
echo "---------------------"
echo "Banner /etc/sshgreeting"
ls -la /etc/sshgreeting 
cat /etc/sshgreeting
echo "---------------------"
echo "/scripts/pullascii"
ls -la /scripts/pullascii
echo "---------------------"
echo "/etc/ssh/ssh_config"
cat /etc/ssh/ssh_config|grep Banner
echo "---------------------"
echo "/etc/crontab"
cat /etc/crontab|grep pullascii 
echo "---------------------"
echo "Press ctrl+c or wait 30 sec"
sleep 30
