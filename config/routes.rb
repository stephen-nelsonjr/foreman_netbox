Rails.application.routes.draw do
  get 'new_action', to: 'foreman_netbox/hosts#new_action'
end
