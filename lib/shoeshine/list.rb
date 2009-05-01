require 'shoeshine/widget'

class List
  include Widget

  STAR_BULLET   = lambda{ |app, *ignore| List.star_image(app) }
  CIRCLE_BULLET = lambda{ |app, *ignore| List.circle_image(app) }
  PLUS_BULLET   = lambda{ |app, *ignore| List.plus_image(app) }
  SPACE_BULLET  = lambda{ |app, *ignore| ' '}
  INDEX_BULLET  = lambda{ |app, counter, separator| List.index_string(app, counter, separator) }
  IMAGE_BULLET  = lambda{ |app, image_url, *ignore| app.image(image_url) unless image_url.nil? }

  IMAGE_SIZE = 20

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
    column_options = {}
    column_options[:width] = show_options[:column_width] unless show_options[:column_width].nil?
    counter = show_options[:index_seed]
    orientation = show_options[:orientation]
    orientation = :vertical if orientation.nil?
    case orientation.to_sym
    when :vertical
      app.stack(show_options) do
        @list_items.each do |item|
          item.app = app
          app.flow do
            item.counter = counter
            item.show @list_opts
            counter = counter.next unless counter.nil?
          end
        end
      end
    when :horizontal
      app.flow(show_options.merge(:width => '100%')) do
        app.background(app.cyan) if $DEBUG
        @list_items.each do |item|
          item.app = app
          app.stack(column_options) do
            app.background(app.red) if $DEBUG
            app.flow do
              app.background(app.yellow) if $DEBUG
              item.counter = counter
              item.show @list_opts
              counter = counter.next unless counter.nil?
            end
          end
        end
      end
    else
      app.error "Invalid orientation value: '#{orientation.to_s}'"
    end
  end


  def self.star_image(app)
    app.image IMAGE_SIZE, IMAGE_SIZE do
      top = IMAGE_SIZE / 2 + 2
      left = IMAGE_SIZE / 2
      points = 5
      outer = IMAGE_SIZE / 3
      inner = IMAGE_SIZE / 6
      app.star(left, top, points, outer, inner)
    end
  end

  def self.circle_image(app)
    app.image IMAGE_SIZE, IMAGE_SIZE do
      top = (IMAGE_SIZE / 2)
      left = (IMAGE_SIZE / 2)
      radius = IMAGE_SIZE / 3
      app.oval(left, top, radius)
    end
  end

  def self.plus_image(app)
    app.image IMAGE_SIZE, IMAGE_SIZE do
      # rect(x,y,w,h) NOTE, docs are wrong
      length = (IMAGE_SIZE * 2) / 3
      beam = 3
      top = ((IMAGE_SIZE - length) / 2) + 2
      left = ((IMAGE_SIZE - length) / 2) + 2
      vertical_center = IMAGE_SIZE / 2
      horizontal_center = IMAGE_SIZE / 2
      app.rect(horizontal_center, top, beam, length, 1)   # vertical bar
      app.rect(left, vertical_center, length, beam, 1)  # horizontal bar
    end
  end

  def self.index_string(app, counter, separator)
    str = ''
    separator ||= ''
    unless counter.nil?
      str = "#{counter}#{separator}"
    end
    app.para(str, :margin_bottom => 0)
  end
end
