#!/usr/bin/env bash

set -e 
set -x

# download the following
# - done here to save disk space in git repo
# - ideally put in s3 bucket and download from there, but this repo is a quick hack

# roles/taskcluster_worker/files/generic-worker-insecure-linux-amd64-v64.2.7
curl -L -o roles/taskcluster_worker/files/generic-worker-insecure-linux-amd64-v64.2.7 \
  https://github.com/taskcluster/taskcluster/releases/download/v64.2.7/generic-worker-insecure-linux-amd64

# roles/taskcluster_worker/files/livelog-linux-amd64-v64.2.7
curl -L -o roles/taskcluster_worker/files/livelog-linux-amd64-v64.2.7 \
  https://github.com/taskcluster/taskcluster/releases/download/v64.2.7/livelog-linux-amd64

# roles/taskcluster_worker/files/start-worker-linux-amd64-v64.2.7
curl -L -o roles/taskcluster_worker/files/start-worker-linux-amd64-v64.2.7 \
  https://github.com/taskcluster/taskcluster/releases/download/v64.2.7/start-worker-linux-amd64

# roles/taskcluster_worker/files/taskcluster-proxy-linux-amd64-v64.2.7
curl -L -o roles/taskcluster_worker/files/taskcluster-proxy-linux-amd64-v64.2.7 \
  https://github.com/taskcluster/taskcluster/releases/download/v64.2.7/taskcluster-proxy-linux-amd64
