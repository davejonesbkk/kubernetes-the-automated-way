
<h3>Requirements & setup</h3>

Make sure you have the following installed and setup: <br />

sshpass <br />

You need to have 5 local virtual machines setup with their hostname and IPs in the hosts file <br />

To run the scrips:<br />

sh deploy.sh <br />

#Order to install

provision_ca.sh <br />

admin_client_cert.sh  <br />

kubelet_client_certs.sh <br />

controller_manager_client_cert.sh <br />

kube_proxy_client_cert.sh <br />

kube_scheduler_client_cert.sh <br />

service_account_key_pair.sh <br />

move_certs.sh <br />


