echo 'If you run multiple clusters, you need to choose which cluster kubectl talks to. You can set a default cluster for kubectl by setting the current context in the Kubernetes kubeconfig file. Additionally you can run following command to set the current context for kubectl.'

kubectl config use-context kind-istio-testing
