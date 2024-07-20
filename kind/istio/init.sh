#!/bin/bash
set -euo pipefail
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

trap "popd; exit" SIGHUP SIGINT SIGTERM
pushd $SCRIPT_DIR > /dev/null

create_cluster() {
    kind create cluster --config=kind-config.yaml
    istioctl install -y
    istioctl verify-install
    kubectl label namespace default istio-injection=enabled
    kubectl patch deployments.apps -n istio-system istio-ingressgateway -p '{"spec":{"template":{"spec":{"containers":[{"name":"istio-proxy","ports":[{"containerPort":8080,"hostPort":8080},{"containerPort":8443,"hostPort":443}]}]}}}}'
    kubectl apply -f debug/
}

load_images() {
    sed -e '/^#/d' -e '/^[[:space:]]*$/d' image-list.txt | while IFS= read -r line; do
        echo kind load docker-image $line;
    done
}

create_cluster

popd > /dev/null
