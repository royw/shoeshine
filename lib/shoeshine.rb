APP_ENV = "development" unless defined? APP_ENV
$:.push(File.join(File.dirname(__FILE__)))
# require 'yaml'
# require 'logger'
# require 'singleton'
# require 'ruby-debug'

require 'shoeshine/widget'
require 'shoeshine/list'
require 'shoeshine/list_item'
require 'shoeshine/drop_down_menu'
require 'shoeshine/horizontal_rule'
