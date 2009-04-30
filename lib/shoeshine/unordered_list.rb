class UnorderedList < List
  include Widget

  public

  def initialize(app, list_opts={})
    self.app = app
    @list_opts = list_opts
    @list_opts ||= {}
    @list_items = []
  end

  def add(list_item)
    @list_items << list_item
  end

  # list_opts => {
  #   :bullet => one_of(BULLETS.keys),
  #   :background => app.background argument
  # }
  def show(opts={})
    list_options = {:margin_bottom => 10}.merge(@list_opts.merge(opts)) unless opts.nil?

    app.stack(list_options) do
      @list_items.each do |item|
        item.app = app
        item.show @list_opts
      end
    end
  end

end
