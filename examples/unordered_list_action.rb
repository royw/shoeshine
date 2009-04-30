require 'action'
require 'nav'
require 'unordered_list_widget'

class UnorderedListAction < Action
  include Nav

  def initialize
    super
    @widget = UnorderedListWidget.new
  end

  def execute()
    app.info "#{self.class.name}.execute"

    page_layout do
      @widget.app = app
      @view_area = @widget.show(VIEW_AREA_OPTS)
    end
  end

end
