#!/bin/bash

go() {
  curl -fsSL https://pkgs.tailscale.com/stable/debian/bullseye.gpg | sudo apt-key add -
  curl -fsSL https://pkgs.tailscale.com/stable/debian/bullseye.list | sudo tee /etc/apt/sources.list.d/tailscale.list

  sudo apt-get update
  sudo apt-get install tailscale

  sudo tailscale up --authkey "$1"
}

go "$1" 2>&1 >> /home/coder/tools/tailscale.log
