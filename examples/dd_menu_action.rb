require 'action'
require 'nav'
require 'dd_menu_widget'

class DropDownMenuAction < Action
  include Nav

  def initialize
    super
    @widget = DDMenuWidget.new
  end

  def execute()
    app.info "#{self.class.name}.execute"

    page_layout do
      @widget.app = app
      @view_area = @widget.show(VIEW_AREA_OPTS)
    end
  end

end
