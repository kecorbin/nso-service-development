# nso-service-development

Sample code / tutorial for getting started developing service packages for Cisco NSO.

For this demo, we will use a very small L2 VLAN as an example, once we've automated it, the number of devices isn't really important.

![img](./assets/diagram.png)

This code provides a sample of codifying this topology and providing a data model, and associated API's for automating the entire lifecycle of the associated configuration.

# Requirements

* NSO 4.7+ - download [here](https://developer.cisco.com/docs/nso/#!getting-nso)


# Setup Instructions

## Install NSO

You can find installation instructions [here](https://developer.cisco.com/docs/nso/#!getting-nso/installation) Make sure you've downloaded the appropriate installer for your platform (Mac/Linux supported)

## Create an NSO development instance

Make sure you've sourced your `ncsrc` file

Assuming you installed NSO at ~/nso-4.7 you would run something like this

```
source ~/nso-4.7/ncsrc
```

## Create some netsim devices to work with.

```
make netsim
```

**NOTE:** the [Makefile](./Makefile) in this repo is to make life easier (you're welcome) you should examine it's contents and understand the underlying commands the targets in this walk through are executing.


## Create an NSO runtime

```
make nso
```

## Verify NSO/Netsim

You can launch a CLI session against your NSO dev instance

```
make cli

```
Verify that your NSO instance is communicating with your sims. They were automatically added when NSO was initialized and detected the presence of netsims

```
admin@ncs# show devices list
NAME  ADDRESS    DESCRIPTION  NED ID     ADMIN STATE
----------------------------------------------------
ios1  127.0.0.1  -            cisco-ios  unlocked
nx1   127.0.0.1  -            cisco-nx   unlocked

admin@ncs# devices sync-from
sync-result {
    device ios1
    result true
}
sync-result {
    device nx1
    result true
}
```

If you need to access the netsim devices directly, you can access them using

```
make ios1_cli

make nx1_cli

```

## Cleanup

You can start over at anytime

```
make clean
```
