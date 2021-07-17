#!/usr/bin/env bash

# shellcheck disable=SC1091
source "$(dirname "${BASH_SOURCE[0]}")/../utilities/docker.sh"

pull_docker_callback() {
  local docker_file="$1"
  local docker_tag="$2"
  local docker_image_id="$3"

  if [[ -z $docker_image_id ]]; then
    if ! pull_docker "${docker_tag}"; then
      build_docker "${docker_file}" "${docker_tag}"
    fi
  fi
}

main() {
  docker_iterate "pull_docker_callback"
}

main
