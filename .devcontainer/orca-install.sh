#!/usr/bin/env bash
# Install the Orca runtime that `orca serve` needs.
#
# NOT `curl -sSL https://onorca.dev | sh`. That URL serves the marketing site's
# HTML (verified: `Content-Type: text/html`, body begins `<!DOCTYPE html>`), so
# piping it to sh executes markup and installs nothing. Orca ships .deb, .rpm
# and AppImage on GitHub Releases; on a Debian-family devcontainer the .deb is
# the right one.
set -euo pipefail

ORCA_VERSION="${ORCA_VERSION:-1.4.200}"
arch="$(dpkg --print-architecture)"          # amd64 | arm64
deb="orca-ide_${ORCA_VERSION}_${arch}.deb"
url="https://github.com/stablyai/orca/releases/download/v${ORCA_VERSION}/${deb}"

echo "==> Installing Orca ${ORCA_VERSION} (${arch})"
tmp="$(mktemp -d)"; trap 'rm -rf "$tmp"' EXIT
curl -fsSL --retry 3 --retry-delay 2 -o "${tmp}/${deb}" "$url"

sudo apt-get update -qq
# apt resolves the .deb's own dependencies (Electron needs libgtk-3, libnss3,
# libasound2 and friends, none of which are in the base image).
sudo apt-get install -y --no-install-recommends "${tmp}/${deb}"
sudo rm -rf /var/lib/apt/lists/*

# The CLI ships inside the app bundle; the .deb may or may not symlink it onto
# PATH. Resolve it either way and pin a stable entry point.
if ! command -v orca >/dev/null 2>&1; then
  found="$(find /opt /usr/lib -maxdepth 4 -type f -name orca -perm -u+x 2>/dev/null | head -1 || true)"
  if [ -z "$found" ]; then
    echo "ERROR: installed the package but found no 'orca' executable." >&2
    exit 1
  fi
  sudo ln -sf "$found" /usr/local/bin/orca
fi

orca --version
echo "==> Orca ready: $(command -v orca)"
