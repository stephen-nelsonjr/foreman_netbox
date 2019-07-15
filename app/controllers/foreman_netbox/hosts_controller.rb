module ForemanNetbox
  # Example: Plugin's HostsController inherits from Foreman's HostsController
  class HostsController < ::HostsController
    # change layout if needed
    # layout 'foreman_netbox/layouts/new_layout'

    def new_action
      @response = NetboxClient.proxy.get_sections
    end
  end
end
