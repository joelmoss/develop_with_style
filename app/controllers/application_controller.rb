class ApplicationController < ActionController::Base
  include Phlexible::Rails::ActionController::ImplicitRender
  include Phlexible::Callbacks

  layout false
  allow_browser versions: :modern
end
