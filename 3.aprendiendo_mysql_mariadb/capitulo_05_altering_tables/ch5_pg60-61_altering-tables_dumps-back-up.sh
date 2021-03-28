mysqldump --user='russell' -p rookery birds > /tmp/birds.sql    # make back-up

mysqldump --user='russell' -p rookery > rookery.sql             # make back-up

mysql --user='russell' -p  rookery < rookery-ch2-end.sql        # restore back-up