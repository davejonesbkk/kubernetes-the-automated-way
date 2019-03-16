#Move kubeconfig files to the worker nodes:

CONTROLLER0_IP=`cat hosts | sed '1!d' | sed 's/.*[=]//'`
CONTROLLER0_HOST=`cat hosts | sed '1!d' | sed 's/[=].*$//'`
CONTROLLER1_IP=`cat hosts | sed '2!d' | sed 's/.*[=]//'`
CONTROLLER1_HOST=`cat hosts | sed '2!d' | sed 's/[=].*$//'`

WORKER0_HOST=`cat hosts | sed '3!d' | sed 's/[=].*$//'`
WORKER0_IP=`cat hosts | sed '3!d' | sed 's/.*[=]//'`
WORKER1_HOST=`cat hosts | sed '4!d' | sed 's/[=].*$//'`
WORKER1_IP=`cat hosts | sed '4!d' | sed 's/.*[=]//'`


sshpass -f passwd scp $WORKER0_HOST".kubeconfig" kube-proxy.kubeconfig "root@$WORKER0_IP:~/"
sshpass -f passwd scp $WORKER1_HOST".kubeconfig" kube-proxy.kubeconfig "root@$WORKER1_IP:~/"

#Move kubeconfig files to the controller nodes:

sshpass -f passwd scp admin.kubeconfig kube-controller-manager.kubeconfig kube-scheduler.kubeconfig "root@$CONTROLLER0_IP:~/"
sshpass -f passwd scp admin.kubeconfig kube-controller-manager.kubeconfig kube-scheduler.kubeconfig "root@$CONTROLLER1_IP:~/"
