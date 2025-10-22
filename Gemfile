source 'https://rubygems.org'

gem 'puma'
gem 'rails', '~> 8.1.0'
gem 'sqlite3', '>= 2.1'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[windows jruby]

gem 'bootsnap', require: false
gem 'kamal', require: false
gem 'thruster', require: false

gem 'phlexible'
gem 'proscenium-phlex'

group :development, :test do
  gem 'amazing_print'
  gem 'debug', platforms: %i[mri windows], require: 'debug/prelude'
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
end

group :development do
  gem 'web-console'
end
