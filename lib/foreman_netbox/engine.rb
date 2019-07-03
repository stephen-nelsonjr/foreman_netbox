module ForemanNetbox
  class Engine < ::Rails::Engine
    engine_name 'foreman_netbox'

    config.autoload_paths += Dir["#{config.root}/app/controllers/concerns"]
    config.autoload_paths += Dir["#{config.root}/app/helpers/concerns"]
    config.autoload_paths += Dir["#{config.root}/app/models/concerns"]
    config.autoload_paths += Dir["#{config.root}/app/overrides"]

    # Add any db migrations
    initializer 'foreman_netbox.load_app_instance_data' do |app|
      ForemanNetbox::Engine.paths['db/migrate'].existent.each do |path|
        app.config.paths['db/migrate'] << path
      end
    end

    initializer 'foreman_netbox.register_plugin', :before => :finisher_hook do |_app|
      Foreman::Plugin.register :foreman_netbox do
        requires_foreman '>= 1.16'

        # Add permissions
        security_block :foreman_netbox do
          permission :view_foreman_netbox, :'foreman_netbox/hosts' => [:new_action]
        end

        # Add a new role called 'Discovery' if it doesn't exist
        role 'ForemanNetbox', [:view_foreman_netbox]

        # add menu entry
        menu :top_menu, :template,
             url_hash: { controller: :'foreman_netbox/hosts', action: :new_action },
             caption: 'ForemanNetbox',
             parent: :infrastructure_menu,
             after: :realms
	sub_menu :top_menu, :template, :caption=> N_('Netbox IPAM'), :after=> :hosts_menu do
   	     menu :top_menu, :level1, :caption=>N_('IP Adresses'), :url_hash => {:controller=> :'foreman_netbox/hosts', :action=>:new_action}
   	     menu :top_menu, :level2, :caption=>N_('Prefixes'), :url_hash => {:controller=> :'foreman_netbox/hosts', :action=>:new_action}
   	     menu :top_menu, :level3, :caption=>N_('Prefix/VLAN Roles'), :url_hash => {:controller=> :'foreman_netbox/hosts', :action=>:new_action}
#    	     sub_menu :top_menu, :inner_level, :caption=> N_('Inner level') do
#      	         menu :top_menu, :level41, :url_hash => {:controller=> :'foreman_netbox/hosts', :action=>:new_action}
#     		 menu :top_menu, :level42, :url_hash => {:controller=> :'foreman_netbox/hosts', :action=>:new_action}
#    	     end
#              menu :top_menu, :level5, :url_hash => {:controller=> :'foreman_netbox/hosts', :action=>:new_action}
        end
	

        # add dashboard widget
        widget 'foreman_netbox_widget', name: N_('Foreman plugin template widget'), sizex: 4, sizey: 1
      end
    end

    # Include concerns in this config.to_prepare block
    config.to_prepare do
      begin
        Host::Managed.send(:include, ForemanNetbox::HostExtensions)
        HostsHelper.send(:include, ForemanNetbox::HostsHelperExtensions)
      rescue => e
        Rails.logger.warn "ForemanNetbox: skipping engine hook (#{e})"
      end
    end

    rake_tasks do
      Rake::Task['db:seed'].enhance do
        ForemanNetbox::Engine.load_seed
      end
    end

    initializer 'foreman_netbox.register_gettext', after: :load_config_initializers do |_app|
      locale_dir = File.join(File.expand_path('../../..', __FILE__), 'locale')
      locale_domain = 'foreman_netbox'
      Foreman::Gettext::Support.add_text_domain locale_domain, locale_dir
    end
  end
end
