#!/bin/bash
function install_dep(){
  export ub="true"
  type apt >/dev/null 2>&1 || { echo >&2 "Instaling gcc, make, git"; export ub="false"; }
  if [ "$ub" = "true" ]; then
    sudo apt-get install gcc make git
  else
    type gcc >/dev/null 2>&1 || { echo >&2 "Rbenv requires gcc. Please install it and re-run this script"; exit 1;}
    type make >/dev/null 2>&1 || { echo >&2 "Rbenv requires make. Please install and re-run this script"; exit 1; }
    type git >/dev/null 2>&1 || { echo >&2 "To install rbenv you need git. Please insall and re-run this script"; exit 1; }
  fi
}

function detect_shell(){
  if [ "$SHELL" = "/bin/zsh" ]; then
    export p_file="$HOME/.zshrc"
  elif [ "$SHELL" = "/bin/bash" ]; then
    export p_file="$HOME/.bashrc"
  else
    export p_file="$HOME/.bash_profile"
  fi
}

function install_rbenv(){
  echo "Cloning rbenv from github"
  sleep 5
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  sleep 2
  echo 'Repo was cloned. Start installing...'
  sleep 3
  cd ~/.rbenv && src/configure && make -C src
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> "$p_file"
  echo 'eval "$(rbenv init -)"' >> "$p_file"
  source $p_file
  echo 'Install ruby-build'
  git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
  source $p_file
  echo "Done!"
}

function install_ruby_and_rails() {
 rbenv install ruby-2.3.0
}

function main(){
  install_dep
  detect_shell
  install_rbenv
  echo 'Do you want to install latest ruby and rails? [y/n]'
  OPTIONS="y n"
  select opt in $OPTIONS; do
    if [ "$opt" = "y" ]; then
       echo "Installing ruby and rails"
       install_ruby_and_rails
    elif [ "$opt" = "n" ]; then
       echo "Exiting"
       exit 0
    else
      clear
      echo bad option
    fi
  done
}

main
