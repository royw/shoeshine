class ListItem
  include Widget

  attr_reader :options

  def initialize(text, opts={})
    @text = text
    @options = opts
    @options ||= {}
  end

  def show(list_options={})
    list_options ||= {}
    show_options = list_options.merge(self.options)

    bullet = show_options[:bullet]
    icon = show_options[:image]
    menu_items = show_options[:menu_items]

    indent = (bullet.nil? ? 0 : 15)
    right = (show_options[:margin_right].nil? ? 0 : show_options[:margin_right])
    left = (show_options[:margin_left].nil? ? 10 : show_options[:margin_left])

    unless icon.nil?
      icon_image = app.image icon
      indent = icon_image.full_width + 5
    else
      unless bullet.nil?
        indent = 15
        List::BULLETS[bullet].call(app)
      end
    end

    unless show_options[:background].nil?
      app.background(show_options[:background], :margin_left => left)
      left += 5
    end
    unless menu_items.nil?
      trigger = show_options[:menu_trigger] || DropDownMenuWidget::RIGHT_BUTTON
      menu = DropDownMenuWidget.new(app, self, trigger, menu_items, menu_options(show_options))
      menu.show
    else
      para_opts = {:margin_left => left, :margin_right => right, :margin_bottom => 0}
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
