install_template_path = File.expand_path("../install/template.rb", __dir__).freeze

desc 'Install and begin Developing with Style.'
task :develop_with_style do
  puts 'Developing with Style...'

  if Rails::VERSION::MAJOR >= 5
    exec "#{RbConfig.ruby} ./bin/rails app:template LOCATION=#{install_template_path}"
  else
    exec "#{RbConfig.ruby} ./bin/rake rails:template LOCATION=#{install_template_path}"
  end
end