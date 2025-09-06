class ApplicationView < HTML
  def layout = ApplicationLayout

  def around_template
    render layout.new do
      super
    end
  end
end
