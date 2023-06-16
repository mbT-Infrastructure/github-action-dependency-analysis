#!/usr/bin/env bash
set -e

DEPENDENCIES=()
REPOSITORY_NAME="github-action-dependency-analysis"
SCRIPT_DIR="$(dirname "$(realpath "$0")")"

# help message
for ARGUMENT in "$@"; do
    if [ "$ARGUMENT" == "-h" ] || [ "$ARGUMENT" == "--help" ]; then
        echo "usage: $(basename "$0")"
        echo "Copy files in builds folder."
        exit
    fi
done

# check dependencies
for CMD in "${DEPENDENCIES[@]}"; do
    if [[ -z "$(which "$CMD")" ]]; then
        echo "\"${CMD}\" is missing!"
        exit 1
    fi
done

PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

mkdir --parents builds

cp "${PROJECT_DIR}/action.yaml" builds
