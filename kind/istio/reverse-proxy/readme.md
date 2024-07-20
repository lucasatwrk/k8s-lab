# Reverse proxy for external services

* [Istio as a Proxy for External Services](https://istio.io/latest/blog/2019/proxy/)

It's a special case using a **DIFFERNT DOMAIN** as the reverse proxy ingress.
Because of that, the proxy needs to terminate ssl.

```sh
# init
bash ${project_root}/script/gencert.sh httpbin.reverse.proxy
kubectl create secret tls proxy-cert -n istio-system --cert=ssl/cert.pem --key=ssl/key.pem

# test proxy
curl -k https://httpbin.reverse.proxy/status/418 --resolve httpbin.reverse.proxy:443:127.0.0.1 -v
curl -sk https://httpbin.reverse.proxy/headers --resolve httpbin.reverse.proxy:443:127.0.0.1 | jq
```
