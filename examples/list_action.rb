require 'action'
require 'nav'
require 'list_widget'

class ListAction < Action
  include Nav

  def initialize
    super
    @widget = ListWidget.new
  end

  def execute()
    app.info "#{self.class.name}.execute"

    page_layout do
      @widget.app = app
      @view_area = @widget.show(VIEW_AREA_OPTS)
    end
  end

end
