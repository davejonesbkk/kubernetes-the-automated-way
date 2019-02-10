#!/bin/bash


CONTROLLER0_IP=`cat hosts | sed '1!d' | sed 's/.*[=]//'`
CONTROLLER0_HOST=`cat hosts | sed '1!d' | sed 's/[=].*$//'`
CONTROLLER1_IP=`cat hosts | sed '2!d' | sed 's/.*[=]//'`
CONTROLLER1_HOST=`cat hosts | sed '2!d' | sed 's/[=].*$//'`

WORKER0_HOST=`cat hosts | sed '3!d' | sed 's/[=].*$//'`
WORKER0_IP=`cat hosts | sed '3!d' | sed 's/.*[=]//'`
WORKER1_HOST=`cat hosts | sed '4!d' | sed 's/[=].*$//'`
WORKER1_IP=`cat hosts | sed '4!d' | sed 's/.*[=]//'`


#Move certs to worker nodes
sshpass -f passwd scp ca.pem $WORKER0_HOST"-key.pem" $WORKER0_HOST".pem" "root@$WORKER0_IP:~/"

sshpass -f passwd scp ca.pem $WORKER1_HOST"-key.pem" $WORKER1_HOST".pem" "root@$WORKER1_IP:~/"

#Move certs to controller nodes
sshpass -f passwd scp ca.pem ca-key.pem kubernetes-key.pem kubernetes.pem \
    service-account-key.pem service-account.pem "root@"$CONTROLLER0_IP":~/"
sshpass -f passwd scp ca.pem ca-key.pem kubernetes-key.pem kubernetes.pem \
    service-account-key.pem service-account.pem "root@"$CONTROLLER1_IP":~/"
