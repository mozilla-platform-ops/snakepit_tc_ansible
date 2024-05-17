# snakepit_tc_ansible

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
ssh root@mlc1-devl.qa.ber3.mozilla.com
cd ~aerickson

# git clone repo

cd snakepit_tc_ansible
# grab tc binaries
./fetch_tc_binaries.sh

# place secrets.yml and vault-password file
#   - secrets.yml is in 1p RelOps vault at https://start.1password.com/open/i?a=NBK7D7DZW5BBBFYVCOK55GXMOE&v=ioli2lam7ekxzqw27oejuds6cu&i=64e3yhj2ddlqtui5cutpsezvza&h=mozilla.1password.com
vi vault-password

# setup python venv
virtualenv venv --python python3
. ./venv/bin/activate
pip install -r requirements.txt
```

### normal usage

```bash
ssh root@mlc1-devl.qa.ber3.mozilla.com
cd ~aerickson/snakepit_tc_ansible
. ./venv/bin/activate
ANSIBLE_NOCOWS=1 ansible-playbook -i inventory.ini --vault-password-file=vault-password snakepit_tc_workers.yml
```

### editing secrets

```bash
ansible-vault edit secrets.yml --vault-password-file vault-password
```

## links

- https://duffney.io/secure-group-variables-with-ansible-vault/
