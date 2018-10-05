# Fact: netmask
#
# Purpose: Returns the netmask for the main interfaces.
#
# Resolution: Uses the `facter/util/netmask` library routines.
#
# Caveats:
#

# netmask.rb
# Find the netmask of the primary ipaddress
# Copyright (C) 2007 David Schmitt <david@schmitt.edv-bus.at>
# Copyright (C) 2007 Mark 'phips' Phillips
#
# idea and originial source by Mark 'phips' Phillips
#
require 'facter/util/netmask-override'

Facter.add("netmask") do
  has_weight 100
  confine :kernel => [ :sunos, :linux, :freebsd, :openbsd, :netbsd, :darwin, :"gnu/kfreebsd", :dragonfly, :AIX ]
  setcode do

  end
end

Facter.add(:netmask) do
  has_weight 100
  confine :kernel => :windows
  setcode do
    require 'facter/util/ip/windows'

    mask = nil

    adapters = Facter::Util::IP::Windows.get_preferred_ipv4_adapters
    adapters.find do |nic|
      nic.IPSubnet.any? do |subnet|

      end
    end

  end
end
