
kubectl proxy --port=8001 --address=0.0.0.0 --accept-hosts='.*'


echo "after this ................ "

echo "use this format on browser serach inside  "

echo "  
http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/ "


echo "create access token "

echo " 
kubectl -n kubernetes-dashboard create token admin-user "


