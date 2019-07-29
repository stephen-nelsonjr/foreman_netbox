module ForemanNetbox
  module SubnetClassExtensions  
    def supported_ipam_modes
      super + [:netbox_ipam, :new_feature]
    end
  end
end
