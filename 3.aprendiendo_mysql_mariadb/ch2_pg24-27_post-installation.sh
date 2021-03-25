
mysqladmin -u root -p flush-privileges password "new_pwd"   # not ask for current password (current password is "new_pwd")
mysqladmin -u root -p flush-privileges password
mysql -u root -p -e "SELECT User,Host FROM mysql.user;"

mysql -u root -p -e "SELECT User,Host FROM mysql.user;"

mysql -u root -p -e "SET PASSWORD FOR 'root'@'127.0.0.1' = PASSWORD('dcrojas.3124');"  # if appear in "SELECT User,Host FROM mysql.user;"
mysql -u root -p -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('new_pwd');"  # if appear in "SELECT User,Host FROM mysql.user;"
mysql -u root -p -e "DROP USER 'root'@'%';"                                     # if appear in "SELECT User,Host FROM mysql.user;"
mysql -u root -p -e "DROP USER ''@'localhost';"                                 # if appear in "SELECT User,Host FROM mysql.user;"

mysqladmin -u root -p flush-privileges  # to take effect on any user/password changes


mysql -u root -p -e "GRANT USAGE ON *.*
TO 'russell'@'localhost'
IDENTIFIED BY 'Rover#My_1st_Dog&Not_Yours!';"

mysql -u root -p -e "GRANT SELECT ON *.* TO 'russell'@'localhost';"

mysql -u root -p -e "SHOW GRANTS FOR 'russell'@'localhost' \G"  # /G shows an asterisk line for each row

mysql -u root -p -e "GRANT ALL ON *.* TO 'russell'@'localhost';"
