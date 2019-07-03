module ForemanNetbox
  # Example: Plugin's HostsController inherits from Foreman's HostsController
  class HostsController < ::HostsController
    # change layout if needed
    # layout 'foreman_netbox/layouts/new_layout'

    def new_action
      # automatically renders view/foreman_netbox/hosts/new_action
      @host = Host.new(host_params)
      @host.managed = true if (params[:host] && params[:host][:managed].nil?)
      forward_url_options
      if @host.save
        process_success :success_redirect => index
      else
        load_vars_for_ajax
        offer_to_overwrite_conflicts
        process_error
      end
    end
    
    def index
      # automatically renders view/foreman_netbox/hosts/new_action
    end
  end
end
