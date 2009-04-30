#!/usr/bin/env shoes

Shoes.setup do
#   gem 'ruby-debug'
end

require File.join(File.dirname(__FILE__), '..', 'lib', 'shoeshine')
$:.push(File.join(File.dirname(__FILE__)))

require 'nav'
require 'action'
require 'dd_menu_action'
require 'index_action'
require 'ordered_list_action'
require 'unordered_list_action'

class ListExample < Shoes
  include Nav

  # a little meta programming to setup the three parts to each page like:
  #
  #  FOO = '/foo'
  #  page_def FOO, :foo, FooAction
  #
  # yeilds:
  #
  #  url '/foo', :foo
  #  @@actions[:foo] = FooAction
  #  def foo
  #    run_action(:foo)
  #  end
  class << self
    def page_def(page, name, klass)
      class_eval "url '#{page.to_s}', :#{name.to_s}"
      class_eval "@@actions[:#{name.to_s}] = #{klass}.new"
      class_eval "def #{name.to_s}; run_action(:#{name.to_s}); end"
    end
  end

  # @@actions instance must be before any page_def statements
  @@actions = {}

  # define our pages
  page_def INDEX_PAGE,          :index,           IndexAction
  page_def UNORDERED_LIST_PAGE, :ul,              UnorderedListAction
  page_def ORDERED_LIST_PAGE,   :ol,              OrderedListAction
  page_def DROP_DOWN_MENU_PAGE, :drop_down_menu,  DropDownMenuAction

  private

  def run_action(action, *args)
    a = @@actions[action]
    a.app = self
    a.execute(*args)
  end
end

# start the GUI
Shoes.app(:title => 'Shoeshine Examples', :width => 800, :resizable => true)
