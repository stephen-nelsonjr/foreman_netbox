module ForemanNetbox
  module SubnetClassExtensions  
    def supported_ipam_modes
      super + [:netbox_ipam]
    end
  end
end
