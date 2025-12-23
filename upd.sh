#!/bin/sh
sudo nix flake update
sudo darwin-rebuild switch --flake .#mac
