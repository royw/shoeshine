require 'shoeshine/widget'
class TitleWidget
  include Widget

  def show
    app.stack(:width => '100%') do
      app.background app.gradient(app.rgb(0, 0, 255), app.rgb(0, 255, 255), :angle => 135)
      app.title("Shoeshine Examples", :align => 'center')
    end
  end

end
