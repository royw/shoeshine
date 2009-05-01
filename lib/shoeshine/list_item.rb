class ListItem
  include Widget

  attr_reader :options
  attr_accessor :counter

  def initialize(text, opts={})
    @text = text
    @options = opts
    @options ||= {}
    @counter = nil
  end

  def show(list_options={})
    list_options ||= {}
    show_options = list_options.merge(self.options)
    bullet_options = {}
    bullet_options[:width] = show_options[:indent].nil? ? 20 : show_options[:indent]

    bullet = show_options[:bullet]
    menu_items = show_options[:menu_items]

#     right = (show_options[:margin_right].nil? ? 0 : show_options[:margin_right])
#     left = (show_options[:margin_left].nil? ? 10 : show_options[:margin_left])
#     left = (show_options[:indent].nil? ? 10 : show_options[:indent])

    unless show_options[:background].nil?
      app.background(show_options[:background], :margin_left => bullet_options[:width])
#       app.background(show_options[:background])
#       left += 5
    end

    unless bullet.nil?
      app.flow(bullet_options) do
        bullet_image = bullet.call(app, @counter, show_options[:index_separator])
      end
    end

    unless menu_items.nil?
      trigger = show_options[:menu_trigger] || DropDownMenuWidget::RIGHT_BUTTON
      menu = DropDownMenuWidget.new(app, self, trigger, menu_items, menu_options(show_options))
      menu.show
    else
      para_opts = {:margin_bottom => 0}
      app.para(self.as_value(app), para_opts)
    end
  end

  def menu_options(show_options)
    {
      :margin_top => 4,
      :margin_left => (show_options[:margin_left].nil? ? 10 : show_options[:margin_left]),
      :margin_right => (show_options[:margin_right].nil? ? 0 : show_options[:margin_right]),
      :margin_bottom => 0,
      :background => app.gainsboro,
      :border => app.gray
    }.merge(show_options[:menu_options])
  end

  def as_value(app)
    result = ''
    if @options[:click].nil?
      result = @text
    else
      result = app.link(@text, :click => @options[:click])
    end
    result || ''
  end

end
