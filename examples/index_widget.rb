class IndexWidget
  include Widget

  def initialize
    @welcome_message = <<END_WELCOME
Welcome to Shoeshine.

Shoeshine is a set of UI widgets for use with the shoes toolkit.

Simply select a page on the left to see the examples.

Have fun,
Roy
END_WELCOME
  end

  def show(opt={})
    app.stack(opt) do
      app.para @welcome_message
    end
  end

end
