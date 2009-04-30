class ListItem
  include Widget

  attr_reader :options

  def initialize(text, opts={})
    @text = text
    @options = opts
    @options ||= {}
  end

  def show(list_options={})
    item_opts = self.options
    right = (list_options[:margin_right].nil? ? 0 : list_options[:margin_right])
    left = 10
    bullet = @options[:bullet] || item_opts[:bullet] || list_options[:bullet]
    icon = @options[:image] || item_opts[:image] || list_options[:image]
    menu_items = @options[:menu_items] || item_opts[:menu_items] || list_options[:menu_items]
    indent = (bullet.nil? ? 0 : 15)
    app.flow(:margin_left => indent) do
      unless icon.nil?
        icon_image = app.image icon
        indent = icon_image.full_width + 5
      else
        unless bullet.nil?
          indent = 15
          List::BULLETS[bullet].call(app)
        end
      end
      app.stack do
        bg = item_opts[:background] || list_options[:background]
        unless bg.nil?
          app.background(bg, :margin_left => left)
          left += 5
        end
        unless menu_items.nil?
          menu_options = {
            :margin_top => 4,
            :margin_left => left,
            :margin_right => right,
            :margin_bottom => 0,
            :background => app.gainsboro,
            :border => app.gray
          }.merge(@options[:menu_options] || item_opts[:menu_options] || list_options[:menu_options] || {})
          trigger = @options[:menu_trigger] || DropDownMenuWidget::RIGHT_BUTTON
          menu = DropDownMenuWidget.new(app, self, trigger, menu_items, menu_options)
          menu.show
        else
          app.para(self.as_value(app), :margin_left => left, :margin_right => right, :margin_bottom => 0)
        end
      end
    end
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
