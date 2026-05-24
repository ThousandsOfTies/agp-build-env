#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
repos_dir="${repo_root}/repos"

install_packages() {
  if command -v apt-get >/dev/null 2>&1; then
    local apt=(apt-get)
    if [[ "$(id -u)" != "0" ]]; then
      apt=(sudo apt-get)
    fi

    "${apt[@]}" update
    "${apt[@]}" install -y \
      build-essential \
      file \
      gcc-aarch64-linux-gnu \
      git \
      libfuse3-dev \
      make \
      openssh-client \
      python3
  fi
}

clone_or_update() {
  local url="$1"
  local name="$2"
  local dst="${repos_dir}/${name}"

  if [[ -d "${dst}/.git" ]]; then
    git -C "${dst}" pull --ff-only
  else
    git clone "${url}" "${dst}"
  fi
}

install_packages
mkdir -p "${repos_dir}"

clone_or_update "https://github.com/ThousandsOfTies/agp-tools.git" "agp-tools"
clone_or_update "https://github.com/ThousandsOfTies/embedded-poc-app.git" "embedded-poc-app"

echo "AgentCockpit build environment is ready."
