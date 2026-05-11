# istio

GitOps repository for deploying Knative Istio networking components using Argo CD.

This repository vendors the upstream Knative Istio release manifests so they can be managed cleanly through GitOps workflows.

## Contents

- `crds.yaml`
  - Istio CRDs extracted from the upstream release manifest.

- `istio.yaml`
  - Istio resources without CRDs.

- `net-istio.yaml`
  - Knative net-istio integration resources.

- `update.sh`
  - Utility script to update manifests from upstream releases.

---

## Repository Structure

```text
.
├── crds.yaml
├── istio.yaml
├── net-istio.yaml
└── update.sh
