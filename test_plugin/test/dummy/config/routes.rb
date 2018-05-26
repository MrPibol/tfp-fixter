Rails.application.routes.draw do
  mount TestPlugin::Engine => "/test_plugin"
end
