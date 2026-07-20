echo "download istio form this URL.." curl -L https://istio.io/downloadIstio | sh -
echo "--------------------------------------------------->>."
echo "cd onto istio-1.30.3  directory into."
echo "--------------------------------------------------->>."
echo "change /bin PATH to client path (your PATH) cp /bin/istioctl  /usr/bin/ "

echo "run this command < istioctl >"
echo "--------------------------------------------------------..."

echo "install istio ..... run this command inside current PATH /istio-1.30.3  ====>> ' stioctl install -f samples/bookinfo/demo-profile-no-gateways.yaml -y  ' "

echo "then------------------------->>>>>"

echo "run command...  kubectl label namespace default istio-injection=enabled "
