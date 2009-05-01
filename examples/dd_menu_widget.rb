class DDMenuWidget
  include Widget

  def initialize
  end

  def show(opt={})
    app.info "#{self.class.name}.show"
    app.stack(opt) do
      app.para "The left column has active links with right click for drop down menu."
      app.para "The right column has hover activation for the drop down menu."
      app.para "Both columns close the menu when the mouse leaves it."
      app.flow do
        app.stack(:width => 100) do
          app.para "right click"
          list = List.new(app)
          numbers = %w(one two three four five).collect do |item|
            ListItem.new(item,
                        :click => lambda{alert("#{item} was clicked")})
          end
          %w(alpha bravo charlie delta echo foxtrot).each do |item|
            list.add(ListItem.new(item,
                                  :menu_items => numbers,
                                  :menu_trigger => DropDownMenuWidget::RIGHT_BUTTON,
                                  :menu_options => {:width => 70},
                                  :click => lambda{alert("#{item} was clicked")},
                                  :bullet => List::CIRCLE_BULLET
                                  ))
          end
          list.show
          app.rect(90, 0, 1, 180)
        end
        app.stack(:width => 100) do
          app.para 'hover'
          list = List.new(app)
          numbers = %w(six seven eight nine).collect do |item|
            ListItem.new(item,
                        :click => lambda{alert("#{item} was clicked")})
          end
          %w(golf hotel india juliet kilo lima).each do |item|
            list.add(ListItem.new(item,
                                  :menu_items => numbers,
                                  :menu_trigger => DropDownMenuWidget::HOVER,
                                  :menu_options => {:width => 70},
                                  :bullet => List::PLUS_BULLET
                                  ))
          end
          list.show
        end
      end
    end
  end

end
