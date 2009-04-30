require 'shoeshine/list_item'
require 'shoeshine/widget'
class DropDownMenuWidget
  include Widget

  LEFT_BUTTON   = 1
  MIDDLE_BUTTON = 2
  RIGHT_BUTTON  = 4
  HOVER         = 8

  # app => Shoes.app
  # title_item => instance that responds to either ListItem.as_value(app) or .to_s
  # menu_items => Array of ListItem instances
  # options => Hash may include:
  #   :background => pattern for drop down menu item background
  #   :border => pattern for drop down menu item background
  #   other slot options such as :width, :margin, ...
  def initialize(app, title_item, activation_trigger, menu_items, options={})
    self.app = app
    @title_item = title_item
    @trigger = activation_trigger
    @menu_items = menu_items
    @options = options
    @activated = false
    @activated_items = []
    @stack_opts = nil
  end

  # show the widget, initially in the deactivated (collapsed) state
  # opts => same as initialize's options
  def show(opts={})
    @stack_opts ||= {:margin => 0}.merge(opts).merge(@options)
    @slot = app.stack(@stack_opts) { show_item }
  end

  protected

  # show the menu
  def activate
    @menu_items.each do |item|
      @slot.append do
        @activated_items << app.flow do
          app.background(@stack_opts[:background]) unless @stack_opts[:background].nil?
          app.border(@stack_opts[:border]) unless @stack_opts[:border].nil?
          app.para(item.as_value(app), :margin => 5)
        end
        app.leave {deactivate}
      end
    end
  end

  # remove the menu
  def deactivate
    unless @activated_items.empty?
      @activated_items.each do |item|
        item.remove
      end
      @activated_items.clear
      @slot.clear { show_item }
    end
  end

  # used by both show and deactivate to show the item with
  # the popup hooked to the right mouse button.
  def show_item
    if @title_item.respond_to? "as_value"
      value = @title_item.as_value(app)
    else
      value = @title_item.to_s
    end
    app.para value, :margin => 0
    if((@trigger & HOVER) == HOVER)
      app.hover do
        activate if @activated_items.empty?
      end
    end
    if((@trigger & (LEFT_BUTTON | MIDDLE_BUTTON | RIGHT_BUTTON)) > 0)
      app.click do |button, top, left|
        if trigger_fired?(button, @trigger)
          @activated_items.empty? ? activate : deactivate
        end
      end
    end
  end

  def trigger_fired?(button, trigger)
    result = false
    result = true if (button == 1) && (trigger & LEFT_BUTTON != 0)
    result = true if (button == 2) && (trigger & MIDDLE_BUTTON != 0)
    result = true if (button == 3) && (trigger & RIGHT_BUTTON != 0)
    result
  end

end
