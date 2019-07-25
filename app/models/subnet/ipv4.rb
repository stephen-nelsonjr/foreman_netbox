require 'socket'

module ForemanNetbox
  module ipv4 < Subnet::Ipv4 
    prepend Subnet::Ipv4 
      def super.supported_ipam_modes
        [:netbox_ipam]
      end
    end
  end
end
