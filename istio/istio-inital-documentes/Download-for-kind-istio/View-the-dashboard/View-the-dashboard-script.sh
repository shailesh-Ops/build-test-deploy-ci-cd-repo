
echo "this file run inside < /istio-1.30.3 > "
echo ".................................>"


echo "first step is bing...."
kubectl apply -f samples/addons/kiali.yaml

echo "..........................................."

echo "rollout deployment...................."
kubectl rollout status deployment/kiali -n istio-system

