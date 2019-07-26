require 'socket'

module ForemanNetbox
   class ipv4_cont
      prepend Subnet::Ipv4 
      
       def super.supported_ipam_modes
        [:netbox_ipam]
      end
   end
end
