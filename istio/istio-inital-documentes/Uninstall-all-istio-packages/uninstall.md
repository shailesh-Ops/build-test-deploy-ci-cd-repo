Uninstall
To delete the Bookinfo sample application and its configuration, see Bookinfo cleanup.

The Istio uninstall deletes the RBAC permissions and all resources hierarchically under the istio-system namespace. It is safe to ignore errors for non-existent resources because they may have been deleted hierarchically.

$ kubectl delete -f samples/addons
$ istioctl uninstall -y --purge

The istio-system namespace is not removed by default. If no longer needed, use the following command to remove it:

$ kubectl delete namespace istio-system

The label to instruct Istio to automatically inject Envoy sidecar proxies is not removed by default. If no longer needed, use the following command to remove it:

$ kubectl label namespace default istio-injection-

If you installed the Kubernetes Gateway API CRDs and would now like to remove them, run one of the following commands:

If you ran any tasks that required the experimental version of the CRDs:

$ kubectl kustomize "github.com/kubernetes-sigs/gateway-api/config/crd/experimental?ref=v1.5.1" | kubectl delete -f -

Otherwise:

$ kubectl kustomize "github.com/kubernetes-sigs/gateway-api/config/crd?ref=v1.5.1" | kubectl delete -f -



NOTE:- reference from https://istio.io/latest/docs/setup/getting-started/
