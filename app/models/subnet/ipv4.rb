require 'socket'

module ForemanNetbox
  class ipv4 < Subnet::Ipv4 
    prepend Subnet::Ipv4 
      def self.supported_ipam_modes
        [:netbox_ipam]
        super
      end
    end
  end
end
