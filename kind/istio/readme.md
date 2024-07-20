# Istio in kind

* [How to install Kind and Istio ingress controller](https://medium.com/@s4l1h/how-to-install-kind-and-istio-ingress-controller-3b510834c762)
* [通过 istioctl describe 检查您的网格](https://istio.io/latest/zh/docs/ops/diagnostic-tools/istioctl-describe/)
* [使用 Istioctl Analyze 诊断配置](https://istio.io/latest/zh/docs/ops/diagnostic-tools/istioctl-analyze/)
* [开启 Envoy 访问日志](https://istio.io/latest/zh/docs/tasks/observability/logs/access-log/#enable-envoy-s-access-logging)
* [istio - gateway](https://istio.io/latest/docs/reference/config/networking/gateway/)

## Install istioctl

```sh
curl -L https://istio.io/downloadIstio | sh -

# from relese file
curl -LO https://github.com/istio/istio/releases/download/1.22.3/istioctl-1.22.3-linux-amd64.tar.gz
```

## Envoy log

* [Engarde - Stay on guard with Envoy Access Logs](https://github.com/nitishm/engarde)

```sh
curl -LO https://github.com/nitishm/engarde/releases/download/v0.1.1/engarde_0.1.1_Linux_x86_64.zip

# ingress gateway
kubectl logs -l istio=ingressgateway -c istio-proxy -n istio-system | engarde --use-istio | jq
```
