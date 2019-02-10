#!/bin/bash

sh provision_ca.sh 

sleep 3

sh admin_client_cert.sh 

sleep 3

sh kubelet_client_certs.sh 

sleep 3

sh controller_manager_client_cert.sh 

sleep 3

sh kube_proxy_client_cert.sh 

sleep 3

sh kube_scheduler_client_cert.sh

sleep 3

sh kube_api_server_cert.sh  

sleep 3

sh service_account_key_pair.sh 

sleep 3

sh move_certs.sh 
