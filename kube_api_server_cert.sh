#!/bin/bash

cd ~/home/david/kthw-demo

CONTROLLER0_IP=`cat hosts | sed '1!d' | sed 's/.*[=]//'`
CONTROLLER0_HOST=`cat hosts | sed '1!d' | sed 's/[=].*$//'`
CONTROLLER1_IP=`cat hosts | sed '2!d' | sed 's/.*[=]//'`
CONTROLLER1_HOST=`cat hosts | sed '2!d' | sed 's/[=].*$//'`
LOADBALANCER_IP=`cat hosts | sed '5!d' | sed 's/.*[=]//'`
LOADBALANCER_HOST=`cat hosts | sed '5!d' | sed 's/[=].*$//'`

CERT_HOSTNAME=10.32.0.1,$CONTROLLER0_IP,$CONTROLLER0_HOST,$CONTROLLER1_IP,$CONTROLLER1_HOST,$LOADBALANCER_IP,$LOADBALANCER_HOST,127.0.0.1,localhost,kubernetes.default

{

cat > kubernetes-csr.json << EOF
{
  "CN": "kubernetes",
  "key": {
    "algo": "rsa",
    "size": 2048
  },
  "names": [
    {
      "C": "US",
      "L": "Portland",
      "O": "Kubernetes",
      "OU": "Kubernetes The Hard Way",
      "ST": "Oregon"
    }
  ]
}
EOF

cfssl gencert \
  -ca=ca.pem \
  -ca-key=ca-key.pem \
  -config=ca-config.json \
  -hostname=${CERT_HOSTNAME} \
  -profile=kubernetes \
  kubernetes-csr.json | cfssljson -bare kubernetes

}
