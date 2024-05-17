#!/usr/bin/env bash

set -e
set -x

# rsync to mlc1-devl.qa.ber3.mozilla.com
rsync -avr --progress --delete --exclude=".venv" --exclude='.git/' . mlc1-devl.qa.ber3.mozilla.com:snakepit_tc_ansible
