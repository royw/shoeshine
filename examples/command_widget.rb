class CommandWidget
  include Widget
  include Nav

  def show(opt={})
    app.stack(opt) do
      app.background app.gradient(app.rgb(0, 255, 255), app.rgb(255, 0, 255), :angle => -35)
      command_list = UnorderedList.new(app, :left_margin => 0)
      command_list.add ListItem.new("Index",
                                    :click => lambda{app.visit(INDEX_PAGE)},
                                    :bullet => List::STAR_BULLET)
      command_list.add HorizontalRule.new(:width => opt[:width])
      command_list.add ListItem.new("Unordered Lists",
                                    :click => lambda {app.visit(UNORDERED_LIST_PAGE)},
                                    :bullet => List::CIRCLE_BULLET)
      command_list.add ListItem.new("Ordered Lists",
                                    :click => lambda {app.visit(ORDERED_LIST_PAGE)},
                                    :bullet => List::CIRCLE_BULLET)
      command_list.add ListItem.new("DropDownMenus",
                                    :click => lambda {app.visit(DROP_DOWN_MENU_PAGE)},
                                    :bullet => List::CIRCLE_BULLET)
      command_list.show
    end
  end

end
