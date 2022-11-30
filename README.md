# Kubeflow Helm Charts

This repo is based on getindata [kubeflow-pipelines helm chart project](https://github.com/getindata/helm-charts/tree/main/charts/kubeflow-pipelines), licensed under [Apache 2.0](https://github.com/getindata/helm-charts/blob/main/LICENSE).

Initially used getindata helm-chart with overridden values and configurations. Created this project hoping to perform more customization and installing additional components to the kubeflow-pipelines installation.

## Notes

### Changes

* Added run script `upgrade.sh` using `helm upgrade` so that we can upgrade (if there's an existing deployment with a new release) or install (otherwise).
* Changed to latest kubeflow pipeline components.

### Tested on

* Local
  * Kubernetes 1.24.6
  * Rancher Desktop (containerd 1.6.8 + k3s)

## Setup

1. Install the helm chart:

   ```shell
   helm install kubeflow-pipelines . --namespace kubeflow --create-namespace
   ```

1. Run the following to check the status of the installation. Wait for about 1 to 8 minutes. You can ignore `CrashLoopBackOff` status during the wait as some services are waiting for their dependencies to come online.

   ```shell
   kubectl get pods -n kubeflow
   ```

1. Once you see that all pods are up and running. Create a port-forward to the dashboard.

   ```shell
   kubectl port-forward svc/ml-pipeline-ui 9000:80 -n kubeflow
   ```

   Launch a web browser and navigate to <http://localhost:9000>.

## Credits and References

* [Github: Getindata Helm Charts](https://github.com/getindata/helm-charts)
* [Kubeflow Pipelines Running 5 Minutes](https://getindata.com/blog/kubeflow-pipelines-running-5-minutes/)
