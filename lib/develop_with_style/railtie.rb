require "rails/railtie"

require "develop_with_style/helper"

class DevelopWithStyle::Engine < ::Rails::Engine
  initializer "webpacker.helper" do
    ActiveSupport.on_load :action_controller do
      ActionController::Base.helper DevelopWithStyle::Helper
    end

    ActiveSupport.on_load :action_view do
      include DevelopWithStyle::Helper
    end
  end
end
