#!/usr/bin/env bash

set -euo pipefail

VERSION="${1:-knative-v1.22.0}"

echo "Updating Knative Istio manifests to ${VERSION}"

curl -L \
  "https://github.com/knative-extensions/net-istio/releases/download/${VERSION}/istio.yaml" \
  -o istio.yaml

curl -L \
  "https://github.com/knative-extensions/net-istio/releases/download/${VERSION}/net-istio.yaml" \
  -o net-istio.yaml

echo "Extracting CRDs..."

yq 'select(.kind == "CustomResourceDefinition")' \
  istio.yaml > crds.yaml

echo "Removing CRDs from istio.yaml..."

yq 'select(.kind != "CustomResourceDefinition")' \
  istio.yaml > /tmp/istio-no-crds.yaml

mv /tmp/istio-no-crds.yaml istio.yaml

echo "Done."
echo
echo "Review changes:"
echo "  git diff"
echo
echo "Commit when ready:"
echo "  git add ."
echo "  git commit -m 'Update Knative Istio to ${VERSION}'"
