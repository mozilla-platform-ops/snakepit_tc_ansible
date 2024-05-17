#!/usr/bin/env bash

set -e
set -x

if [ -z "$1" ]; then
  echo "Please specify a role name!"
  exit 1
fi

mkdir -p roles/$1/tasks
mkdir -p roles/$1/vars
mkdir -p roles/$1/files
# touch roles/$1/tasks/main.yml
# printf -- "---\n\n-" > roles/$1/tasks/main.yml



# readme
if [ ! -e roles/$1/README.md ]; then
  cat << EOF > roles/$1/README.md
# $1

## overview

$1 is great.

## links

- http://www.example.com

EOF
fi



# tasks
file="roles/$1/tasks/main.yml"
if [ ! -e "$file"  ]; then
  cat << EOF > "$file"
---

EOF
fi



# vars
if [ ! -e roles/$1/vars/main.yml ]; then
  cat << EOF > roles/$1/vars/main.yml
---

$1_disabled: false

$1_project_dir: /opt/ansible-$1
$1_git_repo_path: /opt/ansible-$1/repo
$1_config_dir: /opt/ansible-$1/config
$1_git_repo: ''
$1_git_version: ''

EOF
fi
