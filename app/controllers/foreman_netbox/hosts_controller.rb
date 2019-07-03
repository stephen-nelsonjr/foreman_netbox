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
      @client = Client.new(params[:client])
      if @client.save
        redirect_to @client
      else
        # This line overrides the default rendering behavior, which
        # would have been to render the "create" view.
        render "new"
      end
    end
  end
end
