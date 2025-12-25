#!/bin/sh
set -eu

flake_dir="$(cd "$(dirname "$0")" && pwd)"

cd "$flake_dir"
sudo nix flake update

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

cd "$tmp"
sudo darwin-rebuild build --flake "$flake_dir#mac"

old="$(readlink /run/current-system 2>/dev/null || true)"
if [ -z "${old:-}" ]; then
  old="$(readlink /nix/var/nix/profiles/system)"
fi

new="$(readlink "$tmp/result")"

echo "=== diff ==="
nix run nixpkgs#nvd -- diff "$old" "$new"

echo "=== switch ==="
cd "$flake_dir"
sudo darwin-rebuild switch --flake "$flake_dir#mac"
