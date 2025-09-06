class Home::IndexView < ApplicationView
  def view_template
    h1 { 'Home::Index' }
    p { 'Find me in app/views/home/index_view.rb' }
  end
end
