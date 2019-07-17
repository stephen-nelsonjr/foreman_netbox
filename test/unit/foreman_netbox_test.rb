require 'test_plugin_helper'

class ForemanNetboxTest < ActiveSupport::TestCase
  setup do
    User.current = User.find_by_login 'admin'
  end

  test 'the truth' do
#     proxy = FactoryBot.build(:netbox_smart_proxy)
#     assert proxy.has_feature?('Netbox IPAM')
  end
end
