require 'socket'

module ForemanNetbox
  module ipv4.rb
    prepend Subnet::Ipv4 < Subnet
      def self.supported_ipam_modes
        [:netbox_ipam]
      end
    end
  end
end
