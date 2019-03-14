#!/bin/bash
#
masterstatus=0
while [masterstatus eq 0]
do
        mysqladmin -hmysqlmaster -uroot -p$MYSQL_MASTER_PASSWORD processlist 
        if [ $? -eq 0 ]
                then
                        echo "waiting"
                else
                        echo "Proced to slave check"
done