class HorizontalRule
  include Widget

  attr_accessor :counter

  def initialize(opts={})
    @options = opts
    @options ||= {}
  end

  def show(opts={})
    show_opts = @options.merge(opts)
    slot = app.flow(:width => show_opts[:width]) do
      left = 5
      right = show_opts[:width] - 10
      app.rect(left, 0, right, 1)
    end
  end
end
