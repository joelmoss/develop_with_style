module DevelopWithStyle::Helper
  def style(name, tag_name: :div, &block)
    @css_modules ||= []
    @css_modules << @virtual_path unless @css_modules.include?(@virtual_path)

    path = "app/javascript/packs/#{@virtual_path}.module.scss"
    class_name = Base64.encode64(path).gsub(/\W/, '')[0, 8] + "__#{name}"

    block_given? ? tag.send(tag_name, class: class_name, &block) : class_name
  end

  def developed_with_style
    return if @css_modules.blank?

    asset = "#{@virtual_path}#{compute_asset_extname(@virtual_path, type: :stylesheet)}"
    Webpacker.manifest.lookup(asset) && @css_modules.unshift(@virtual_path)

    stylesheet_pack_tag(*@css_modules)
  end
end
