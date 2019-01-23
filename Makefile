all:
	@echo commands: reset

reset:
	vagrant destroy -f
	vagrant up
	ansible-playbook -i inventory/aionic/hosts.ini provision.yml

provision:
	ansible-playbook -i inventory/aionic/hosts.ini provision.yml
