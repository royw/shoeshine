require 'shoeshine/widget'

class UnorderedListWidget
  include Widget
  include Nav

  def initialize
  end

  def show(opt={})
    app.stack(opt) do
      app.flow do
        app.para "Various bullets"
        list_one({})
        list_one({:bullet => List::CIRCLE_BULLET})
        list_one({:bullet => List::STAR_BULLET})
        list_one({:bullet => List::PLUS_BULLET})
      end
      app.flow(opt) do
        app.para "With links"
        list_two({})
        list_two({:bullet => List::CIRCLE_BULLET})
        list_two({:bullet => List::STAR_BULLET})
        list_two({:bullet => List::PLUS_BULLET})
      end
      app.stack(opt) do
        list_horizontal({})
        list_horizontal({:bullet => List::CIRCLE_BULLET})
        list_horizontal({:bullet => List::STAR_BULLET})
        list_horizontal({:bullet => List::PLUS_BULLET})
      end
    end
  end

  def list_one(options)
    app.stack({:width => 80}) do
      list = UnorderedList.new(app, options)
      %w(alpha bravo charlie delta echo foxtrot).each do |item|
        list.add(ListItem.new(item))
      end
      list.show
    end
  end

  def list_two(options)
    app.stack({:width => 80}) do
      list = UnorderedList.new(app, options)
      %w(alpha bravo charlie delta echo foxtrot).each do |item|
        list.add(ListItem.new(item, :click => lambda{alert("#{item} clicked")}))
      end
      list.show
    end
  end

  def list_horizontal(options)
    app.stack do
      list = UnorderedList.new(app, options.merge(:orientation => :horizontal, :width => '100%'))
      %w(alpha bravo charlie).each do |item|
        list.add(ListItem.new(item))
      end
      %w(delta echo foxtrot).each do |item|
        list.add(ListItem.new(item, :click => lambda{alert("#{item} clicked")}))
      end
      list.show
    end
  end

end
