#!/usr/bin/env bash

# Devtools install script for devcontainer
# Instals common useful packages

main () {
  echo "[INFO] Setting timezone"
  sudo ln -sf /usr/share/zoneinfo/Australia/Melbourne /etc/localtime

  echo "[INFO] Updating apt-get"
  sudo apt-get update
  
  echo "[INFO] Installing core packages (e.g gnupg, curl)"
  sudo apt-get install curl wget gnupg -y
  
  echo "[INFO] Installing Go"
  wget -qO go.tar.gz https://golang.org/dl/go1.17.3.linux-amd64.tar.gz
  rm -rf /usr/local/go && tar -C /usr/local -xzf go.tar.gz
  rm -f go.tar.gz
  export PATH=$PATH:/usr/local/go/bin
  echo "export PATH=$PATH:/usr/local/go/bin" >> /root/.bashrc


  # We will install extensions in a separate 'docker exec', because at this point code-server hasn't started yet.
  echo "[INFO] SKIPPING THIS JOB - Installing extensions"
  # go run /home/coder/tools/extensions/install.go

  echo "[INFO] Adding repo key for yarn into package repository"
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  sudo apt-get update -y

  echo "[INFO] Installing tzdata"
  sudo apt-get install tzdata -y

  echo "[INFO] Installing python3.10"
  sudo apt-get install python3.10 python3-pip -y
  sudo apt-get install aptitude -y

  echo "[INFO] Adding node.js package repo to system"
  curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -

  echo "[INFO] Installing node.js and yarn"
  sudo aptitude install nodejs -y
  sudo apt-get update
  sudo apt-get install -y yarn

  echo "[INFO] Installing build-essential"
  sudo apt-get install -y build-essential

  echo "[INFO] Installing Ruby"
  sudo apt-get install -y ruby-full

  echo "[INFO] Installing Git Credential Manager Core"
  wget -qO gcm.deb "https://github.com/microsoft/Git-Credential-Manager-Core/releases/download/v2.0.567/gcmcore-linux_amd64.2.0.567.18224.deb"
  dpkg -i gcm.deb
  rm -f gcm.deb

  echo "[INFO] Installing Docker"
  curl -fsSL https://get.docker.com -o get-docker.sh
  sudo sh get-docker.sh

  echo "[INFO] Settings up .bashrc message"
  echo cat /home/coder/tools/tools/startup.txt >> /root/.bashrc

  # Custom settings.json (symlink so git pull still works)
  # Doing this last so that it's easy to tell if the devtools script has finished yet
  # echo "[INFO] Symlinking settings.json from repo"
  ln -sf /home/coder/tools/tools/settings.template.json $codedir/User/settings.json

  echo "[INFO] Done"
}

main 2>&1 | tee -a /home/coder/tools/devtools-install.log

exit 0