module ForemanNetbox
  class Netboxipam
    def self.proxy
      netbox_ipam_proxy = SmartProxy.with_features('netbox_ipam').first
      ProxyAPI::NetboxIpam.new({:url => netbox_ipam_proxy[:url]})
    end
  end
end
