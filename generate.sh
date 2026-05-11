curl -L \
  https://github.com/knative-extensions/net-istio/releases/download/knative-v1.22.0/istio.yaml \
  -o istio.yaml

curl -L \
  https://github.com/knative-extensions/net-istio/releases/download/knative-v1.22.0/net-istio.yaml \
  -o net-istio.yaml

yq 'select(.kind == "CustomResourceDefinition")' \
  istio.yaml > crds.yaml

yq 'select(.kind != "CustomResourceDefinition")' \
  istio.yaml > /tmp/istio-no-crds.yaml

mv /tmp/istio-no-crds.yaml istio.yaml
