# Ansible

## run playbook

```
ansible-playbook -i hosts site.yml -D
```

## speed up

```
pip3 install mitogen
export ANSIBLE_STRATEGY_PLUGINS=/usr/local/lib/python3.7/site-packages/ansible_mitogen/plugins/strategy
export ANSIBLE_STRATEGY=mitogen_linear
```
