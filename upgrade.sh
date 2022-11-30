#!/usr/bin/env bash

RELEASE='kubeflow-pipelines'
NAMESPACE='kubeflow'
VALUES_FILE='values.yaml'
CHART_PATH="."  # Local chart path

function upgrade_helm_chart_path() {
  local release="${1}"
  local chart="${2}"
  local namespace="${3}"
  local values_file="${4}"
  local extra_flags="${5}"
  local debug='true' # Helpful for troubleshooting. Remove if too noisy.

  echo "Installing helm chart ${release} in ${namespace} namespace..."

  # Prepare the command.
  cmd="helm upgrade ${release} ${chart} --namespace ${namespace} --create-namespace --atomic --install"
  if test -n "${values_file-}"; then
    cmd="${cmd} -f ${values_file}"
  fi
  if test -n "${extra_flags-}"; then
    cmd="${cmd} ${extra_flags}"
  fi
  if "${debug}" = 'true'; then
    cmd="${cmd} --debug"
  fi

  # Execute the command.
  echo "${cmd}"
  if ! eval "${cmd}"; then
    echo "Error upgrading Helm chart ${release}..."
    exit 1
  fi
}

function main() {
  # Install/upgrade helm chart_paths.
  upgrade_helm_chart_path "${RELEASE}" "${CHART_PATH}" "${NAMESPACE}" "${VALUES_FILE}"
}

main
