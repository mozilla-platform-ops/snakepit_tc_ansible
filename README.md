# snakepit_tc_ansible

Ansible code to deploy Taskcluster to the Snakepit cluster.

See https://mozilla-hub.atlassian.net/wiki/spaces/ROPS/pages/26476594/Berlin+Machine+Learning+Cluster+Snakepit.

## debugging

```bash
ssh root@mlc1-devl.qa.ber3.mozilla.com
```

## sending to cluster

```bash
./deploy_repo_to_mlchead.sh
```

## usage

### initial setup

```bash
# git clone this repo

# we use poetry and virtualenv/requirements.txt
#   - poetry is nicer for local
#   - virtualenv is all that's available on mlchead
# setup poetry
poetry shell
poetry install

cd snakepit_tc_ansible
# place secrets.yml and vault-password file
#   - secrets.yml is in 1p RelOps vault at https://start.1password.com/open/i?a=NBK7D7DZW5BBBFYVCOK55GXMOE&v=ioli2lam7ekxzqw27oejuds6cu&i=64e3yhj2ddlqtui5cutpsezvza&h=mozilla.1password.com
vi vault-password

# grab tc binaries
./fetch_tc_binaries.sh
./deploy_repo_to_mlchead.sh  # deploys to your userdir

ssh root@mlc1-devl.qa.ber3.mozilla.com
cd ~aerickson/snakepit_tc_ansible  # or your user

# setup python venv
virtualenv venv --python python3
. ./venv/bin/activate
pip install -r requirements.txt
```

### normal usage

```bash
# run if you make local changes
./deploy_repo_to_mlchead.sh

ssh root@mlc1-devl.qa.ber3.mozilla.com
cd ~aerickson/snakepit_tc_ansible  # or your user
. ./venv/bin/activate
ANSIBLE_NOCOWS=1 ansible-playbook -i inventory.ini --vault-password-file=vault-password snakepit_tc_workers.yml
```

### editing secrets

```bash
ansible-vault edit secrets.yml --vault-password-file vault-password
```

## links

- https://duffney.io/secure-group-variables-with-ansible-vault/
