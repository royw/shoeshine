# From Matt Payne's slimtimeronshoes

require 'nav'
require 'title_widget'
require 'page_widget'
require 'command_widget'

class Action
  include Nav

  attr_accessor :app

  def initialize
    @command_widget = CommandWidget.new
    @title_widget = TitleWidget.new
    @page_widget = PageWidget.new
  end

  def execute(obj=nil)

  end

  def page_layout(&blk)
    @page_widget.app = app
    @page_widget.show

    app.flow(:width => '100%') do
      @title_widget.app = app
      @title_widget.show
      @command_widget.app = app
      @command_widget.show(:width => COMMAND_AREA_WIDTH)
      blk.call unless blk.nil?
    end
  end

end
