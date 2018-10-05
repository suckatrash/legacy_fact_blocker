
# legacy_fact_blocker

## Description

Blocks legacy facts by overriding them and not assigning value.  Example:

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

These facts unneccesarily clutter PuppetDB and cause performance issues in large puppet installations. 

## Setup

### What legacy_fact_blocker affects **OPTIONAL**

If it's obvious what your module touches, you can skip this section. For example, folks can probably figure out that your mysql_instance module affects their MySQL instances.

If there's more that they should know about, though, this is the place to mention:

* Files, packages, services, or operations that the module will alter, impact, or execute.
* Dependencies that your module automatically installs.
* Warnings or other important notices.

## Usage

Just install the module and pluginsync takes care of the rest agent-side during the next catalog compilation.
