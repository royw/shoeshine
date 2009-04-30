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
    show_options = {:margin_bottom => 10}.merge(@list_opts.merge(opts)) unless opts.nil?

    orientation = show_options[:orientation]
    orientation = :vertical if orientation.nil?
    case orientation.to_sym
    when :vertical
      app.stack(show_options) do
        @list_items.each do |item|
          item.app = app
          app.flow do
            item.show @list_opts
          end
        end
      end
    when :horizontal
      app.flow(show_options) do
        @list_items.each do |item|
          item.app = app
          app.stack(:width => 80) do
            item.show @list_opts
          end
        end
      end
    else
      app.error "Invalid orientation value: '#{orientation.to_s}'"
    end
  end

  def show_items
  end
end
