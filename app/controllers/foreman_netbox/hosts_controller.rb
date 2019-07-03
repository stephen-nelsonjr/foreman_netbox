module ForemanNetbox
  # Example: Plugin's HostsController inherits from Foreman's HostsController
  class HostsController < ::HostsController
    # change layout if needed
    # layout 'foreman_netbox/layouts/new_layout'

    def new_action
      # automatically renders view/foreman_netbox/hosts/new_action
    end
    
    def index
      # automatically renders view/foreman_netbox/hosts/new_action
    end
  end
end
