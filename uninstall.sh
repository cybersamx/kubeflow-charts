#!/usr/bin/env bash

CHART_NAME='kubeflow-pipelines'
NAMESPACE='kubeflow'

function main() {
  # Uninstall helm charts.
  helm uninstall "${CHART_NAME}" --namespace "${NAMESPACE}"
}

main
