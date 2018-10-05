#   Prevents these facts from resolving:
#
#   * `ipaddress_<INTERFACE>`
#   * `ipaddress6_<INTERFACE>`
#   * `macaddress_<INTERFACE>`
#   * `netmask_<INTERFACE>`
#   * `mtu_<INTERFACE>`
#

require 'facter/util/ip'
require 'facter/util/macaddress'

# Note that most of this only works on a fixed list of platforms; notably, Darwin
# is missing.

Facter.add(:interfaces) do
  has_weight 100
  confine :kernel => Facter::Util::IP.supported_platforms
  setcode do
    #Facter::Util::IP.get_interfaces.collect { |iface| Facter::Util::IP.alphafy(iface) }.join(",")
  end
end

Facter::Util::IP.get_interfaces.each do |interface|

  # Make a fact for each detail of each interface.  Yay.
  #   There's no point in confining these facts, since we wouldn't be able to create
  # them if we weren't running on a supported platform.
  %w{ipaddress ipaddress6 macaddress netmask mtu}.each do |label|
    Facter.add(label + "_" + Facter::Util::IP.alphafy(interface)) do
      has_weight 100
      setcode do
        if label == "macaddress"

        elsif label == "mtu"

        end
      end
    end
  end
end

