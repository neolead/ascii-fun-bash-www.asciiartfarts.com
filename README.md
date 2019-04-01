# ascii-fun-bash-www.asciiartfarts.com
fun ascii phrases from http://www.asciiartfarts.com for your ssh


#howto
download make-me-ascii.sh 
then chmod it with chmod +x make-me-ascii.sh
and run as root ./make-me-ascii.sh

What happend?
0.Will create folder /scripts
1.Create exec file with wget
2.Remove Banner string from /etc/ssh/sshd_config
3.Add greeting banner file to /etc/ssh/sshd_config
4.Add to /etc/crontab autorun update ascii script with 2 min delay
5.Show result))))
