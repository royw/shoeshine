require 'action'
require 'nav'
require 'index_widget'

class IndexAction < Action
  include Nav

  def initialize
    super
    @widget = IndexWidget.new
  end

  def execute()
    app.info "#{self.class.name}.execute"

    page_layout do
      @widget.app = app
      @view_area = @widget.show(VIEW_AREA_OPTS)
    end
  end

end
