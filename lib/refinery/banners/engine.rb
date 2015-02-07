module Refinery
  module Banners
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Banners

      engine_name :refinery_banners

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "banners"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.banners_admin_banners_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Banners)
      end
    end
  end
end
