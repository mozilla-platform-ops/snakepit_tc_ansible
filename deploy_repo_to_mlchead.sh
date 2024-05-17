#!/usr/bin/env bash

set -e
set -x

rsync -avr --progress --delete --exclude="venv" --exclude='.git/' . mlc1-devl.qa.ber3.mozilla.com:snakepit_tc_ansible
