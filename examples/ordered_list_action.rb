require 'action'
require 'nav'
require 'ordered_list_widget'

class OrderedListAction < Action
  include Nav

  def initialize
    super
    @widget = OrderedListWidget.new
  end

  def execute()
    app.info "#{self.class.name}.execute"

    page_layout do
      @widget.app = app
      @view_area = @widget.show(VIEW_AREA_OPTS)
    end
  end

end
