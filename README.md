# aionic-playground

Provisioning playground for Ansible / bIONIC beaver.
This playbook **ONLY** tested on Ubuntu 18.04.

## How to use

1. Check your target hosts

```bash
λ cat inventory/$YOUR_TAEGET/hosts.ini
```

2. Check the components you want to deploy

```bash
λ cat provision.yml
```

3. Provision

```bash
λ ansible-playbook -i inventory/$YOUR_TAEGET/hosts.ini provision.yaml
```

## Prequirements

* [Ansible](https://www.ansible.com/)
* [Vagrant](https://www.vagrantup.com/)
* [VirtualBox](https://www.virtualbox.org/)

## Try it
* Fire up VMs

```bash
λ vagrant up
```

* Deploy

```bash
λ ansible-playbook -i inventory/aionic/hosts.ini provision.yaml
```
