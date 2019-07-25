require 'socket'

class Subnet::Ipv4 < Subnet
  def self.supported_ipam_modes
      [:netbox_ipam]
  end
end
