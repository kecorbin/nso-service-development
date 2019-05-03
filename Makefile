clean: netsim-clean nso-clean

# netsim targets
netsim:
	ncs-netsim create-device cisco-ios ios1
	ncs-netsim add-device cisco-nx nx1
	ncs-netsim start

netsim-clean:
	-ncs-netsim stop
	rm -rf netsim

ios1_cli:
	ncs-netsim cli-c ios1

nx1_cli:
	ncs-netsim cli-c nx1

# NSO targetss
nso:
	ncs-setup --dest .
	ncs

nso-clean:
	-@echo "Stopping NSO"
	-@ncs --stop
	-@rm -Rf README.ncs agentStore state.yml logs/ ncs-cdb/ ncs-java-vm.log ncs-python-vm.log ncs.conf state/ storedstate target/

packages-clean:
	make -C packages/vlan/src clean

compile:
	make -C packages/vlan/src

reload:
	echo "packages reload" | ncs_cli -u admin -C

packages: packages-clean compile reload

# Handy CLI targets
.PHONY: cli cli-c cli-j

cli: cli-c

cli-c:
	ncs_cli -u admin -C

cli-j:
	ncs_cli -u admin
