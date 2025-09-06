class ApplicationLayout < HTML
  include Phlex::Rails::Helpers::CSPMetaTag
  include Phlex::Rails::Helpers::CSRFMetaTags

  def view_template(&)
    doctype

    html do
      head do
        title { "You're awesome" }
        meta name: 'viewport', content: 'width=device-width,initial-scale=1'
        meta name: 'apple-mobile-web-app-capable', content: 'yes'
        meta name: 'mobile-web-app-capable', content: 'yes'
        csp_meta_tag
        csrf_meta_tags

        link rel: 'icon', href: '/icon.png', type: 'image/png'
        link rel: 'icon', href: '/icon.svg', type: 'image/svg+xml'
        link rel: 'apple-touch-icon', href: '/icon.png'

        include_assets
      end

      body do
        main(&)
      end
    end
  end
end
