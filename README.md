# Kubeflow Helm Charts

This repo is based on GetInData [kubeflow-pipelines helm chart project](https://github.com/getindata/helm-charts/tree/main/charts/kubeflow-pipelines), licensed under [Apache 2.0](https://github.com/getindata/helm-charts/blob/main/LICENSE).

Overrode the values and configurations on the getindata kubeflow-pipelines helm chart, which was great. Hope to now perform customization of the kubeflow-pipelines installation with this project.

## Notes

### Changes

* Added run script `install.sh` using `helm upgrade` so that we can upgrade (if there's an existing deployment with a new release) or install (otherwise).
* Changed to latest kubeflow pipeline components.

### Tested on

* Local
  * Kubernetes 1.24.6
  * Rancher Desktop (containerd 1.6.8 + k3s)
