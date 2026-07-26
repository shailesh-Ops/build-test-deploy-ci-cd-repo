# this command from official istio download documantation 

kind create cluster --name istio-testing  --verbosity=5


#Creating cluster "istio-testing" ...
#DEBUG: docker/images.go:67] Pulling image: kindest/node:v1.35.0@sha256:452d707d4862f52530247495d180205e029056831160e22870e37e3f6c1ac31f ...
# ✓ Ensuring node image (kindest/node:v1.35.0) 🖼
# ✓ Preparing nodes 📦
#DEBUG: config/config.go:96] Using the following kubeadm config for node istio-testing-control-plane:
#apiServer:
#  certSANs:
#  - localhost
#  - 127.0.0.1
#  extraArgs:
#    runtime-config: ""
# apiVersion: kubeadm.k8s.io/v1beta3
# clusterName: istio-testing
# controlPlaneEndpoint: istio-testing-control-plane:6443
