module ForemanNetbox
  # Example: Plugin's HostsController inherits from Foreman's HostsController
  class HostsController < ::HostsController
    # change layout if needed
    # layout 'foreman_netbox/layouts/new_layout'

    def new_action
#       @response = Netbox.proxy.get_sections
    end
    
#     def subnets
#       @subnets = PhpipamClient.proxy.get_subnets(params[:section_id])
#       render :json => @subnets.to_json, :status => :ok
#     end
  end
end
