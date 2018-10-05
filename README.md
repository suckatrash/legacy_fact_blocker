
# legacy_fact_blocker

## Description

Blocks legacy facts by overriding them and not assigning value.  Example:

```
blockdevice_
duplex_
ipaddress6_
ipaddress_
macaddress_
netmask_
netmask6_
network6_
speed_
network_
mtu_
```

These facts unneccesarily clutter PuppetDB and cause performance issues in large puppet installations. 

## Usage

Just install the module and pluginsync takes care of the rest agent-side during the next catalog compilation.
