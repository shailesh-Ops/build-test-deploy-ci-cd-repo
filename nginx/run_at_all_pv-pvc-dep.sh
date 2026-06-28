
echo "create persistent-volume (pv)"
kubectl apply -f persistent.yml

echo "CLAIM... persistentvolumeclaim (pvc)"
kubectl apply -f persistentvolumeclaim.yml

echo "create DEPLOYMENT ..."
kubectl apply -f deployment.yml 

echo "alll three clear and up to running........"

