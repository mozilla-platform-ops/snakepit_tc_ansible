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
cd ~aerickson/snakepit_tc_ansible
./fetch_tc_binaries.sh
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
