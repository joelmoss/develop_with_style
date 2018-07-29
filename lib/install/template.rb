say 'Copying loader to config/webpack/loaders'
copy_file "#{__dir__}/webpacker_loader.js", Rails.root.join('config/webpack/loaders/develop_with_style.js').to_s

say 'Adding loader plugin to config/webpack/environment.js'
insert_into_file Rails.root.join('config/webpack/environment.js').to_s,
  "require('./loaders/develop_with_style')\n",
  after: "require('@rails/webpacker')\n"

say "Copying example entry file to #{Webpacker.config.source_entry_path}"
copy_file "#{__dir__}/examples/layout.css", "#{Webpacker.config.source_entry_path}/layouts/application.css"
copy_file "#{__dir__}/examples/home.module.scss", "#{Webpacker.config.source_entry_path}/pages/home.module.scss"

say 'Adding #developed_with_style helper to app/views/layouts/application.html.erb'
insert_into_file Rails.root.join('app/views/layouts/application.html.erb').to_s,
  "<%= developed_with_style %>\n",
  before: "</head>\n"

say "You're now Developing with Style 🎉", :green
