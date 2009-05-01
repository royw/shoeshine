require 'shoeshine/widget'

class ListWidget
  include Widget
  include Nav

  def initialize
  end

  def show(opt={})
    opt = opt.merge(VIEW_AREA_OPTS)
    app.stack(opt) do
      app.background(app.floralwhite) if $DEBUG
      app.caption "Vertical Lists"

      app.para "Various Bullets"
      app.flow do
        app.background(app.gainsboro) if $DEBUG
        @x = 0
        list_one(80, {})
        list_one(80, {:bullet => List::CIRCLE_BULLET})
        list_one(100, {:bullet => List::STAR_BULLET, :indent => 40, :background => app.yellow})
        list_one(80, {:bullet => List::PLUS_BULLET, :background => app.cyan})
        list_one(80, {:bullet => List::INDEX_BULLET, :index_seed => '1', :index_separator => '.'})
        list_one(80, {:bullet => List::INDEX_BULLET, :index_seed => 'a', :index_separator => ')'})
        list_one(80, {:bullet => List::INDEX_BULLET, :index_seed => 'G', :index_separator => ''})
      end

      app.para "With Links"
      app.flow do
        app.background(app.lavender) if $DEBUG
        @x = 0
        list_two(80, {})
        list_two(80, {:bullet => List::CIRCLE_BULLET})
        list_two(80, {:bullet => List::STAR_BULLET})
        list_two(80, {:bullet => List::PLUS_BULLET})
      end

      app.caption "Horizontal Lists"
      app.stack do
        app.background(app.khaki) if $DEBUG
        @y = 0
        list_horizontal(30, {:column_width => 90})
        list_horizontal(30, {:column_width => 100, :bullet => List::CIRCLE_BULLET})
        list_horizontal(30, {:column_width => 110, :bullet => List::STAR_BULLET})
        list_horizontal(30, {:column_width => 120, :bullet => List::PLUS_BULLET})
      end

      app.para ''
    end
  end

  def list_one(width, options)
    app.stack({:width => width}) do
      list = List.new(app, options)
      %w(alpha bravo charlie delta echo foxtrot).each do |item|
        list.add(ListItem.new(item))
      end
      list.show
    end
    @x += width
    app.rect(@x,0,1,140)
  end

  def list_two(width, options)
    app.stack({:width => width}) do
      list = List.new(app, options)
      %w(alpha bravo charlie delta echo foxtrot).each do |item|
        list.add(ListItem.new(item, :click => lambda{alert("#{item} clicked")}))
      end
      list.show
    end
    @x += width
    app.rect(@x,0,1,140)
  end

  def list_horizontal(height, options)
    app.stack(:height => height, :width => '100%') do
      app.background(app.deeppink) if $DEBUG
      list = List.new(app, options.merge(:orientation => :horizontal, :width => '100%'))
      %w(alpha bravo charlie).each do |item|
        list.add(ListItem.new(item))
      end
      %w(delta echo).each do |item|
        list.add(ListItem.new(item, :click => lambda{alert("#{item} clicked")}))
      end
      list.show
    end
    @y += height
    app.rect(0, @y, 5 * options[:column_width], 1)
  end

end
