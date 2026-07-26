
echo "this file it has 15 step's for completation of istio ..."
echo "--------------------------------------------------------..."




echo "step 1.. download istio form this URL.." curl -L https://istio.io/downloadIstio | sh -
echo "--------------------------------------------------->>."
echo "step 2.. cd onto istio-1.30.3  directory into."
echo "--------------------------------------------------->>."
echo "step 3... change /bin PATH to client path (your PATH) cp /bin/istioctl  /usr/bin/ "

echo "step 4... run this command < istioctl >"
echo "--------------------------------------------------------..."

echo "step 5...install istio ..... run this command inside current PATH /istio-1.30.3  ====>> ' stioctl install -f samples/bookinfo/demo-profile-no-gateways.yaml -y  ' "

echo "then------------------------->>>>>"

echo "step 6... run command...  kubectl label namespace default istio-injection=enabled "

echo "then------------------------->>>>>"
echo "step 7... run command.... kubectl get crd gateways.gateway.networking.k8s.io &> /dev/null || \
{ kubectl kustomize "github.com/kubernetes-sigs/gateway-api/config/crd?ref=v1.5.1" | kubectl apply -f -; } "

echo "then------------------------->>>>>"
echo "step 8... run command inside /istio-1.30.3 directory.... rather than it doesn't run..  kubectl apply -f samples/bookinfo/platform/kube/bookinfo.yaml "

echo "then------------------------->>>>>"

# Note that the pods show READY 2/2, confirming they have their application container and the Istio sidecar container.

echo "step 9.... run this an command for display service which is run's on default namespace onside....'  kubectl get service'  then ' kubectl get pods ' "

echo "--------------------------------------------------------..."

echo " this is final step of this script ... "
echo "step 10....    ' kubectl exec "$(kubectl get pod -l app=ratings -o jsonpath='{.items[0].metadata.name}')" -c ratings -- curl -sS productpage:9080/productpage | grep -o "<title>.*</title>" ' " 



