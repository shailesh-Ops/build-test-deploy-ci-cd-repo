token=$(kubectl -n kubernetes-dashboard create token admin-user)

echo $token 

echo "copy this........then past inside.....login-page...."
