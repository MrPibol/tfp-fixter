module TestPlugin
  class Engine < ::Rails::Engine
    require 'ranked-model'
    isolate_namespace TestPlugin
  end
end
