class HTML < Phlex::HTML
  include Proscenium::Phlex::IncludeAssets
  include Proscenium::Phlex::Sideload
  include Phlexible::Callbacks
  include Phlexible::Rails::AElement
  include Phlex::Rails::Helpers::Routes

  before_template { comment { ">> #{self.class.name}" } } if Rails.env.development?
end
