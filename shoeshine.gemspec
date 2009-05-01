# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{shoeshine}
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Roy Wright"]
  s.date = %q{2009-05-01}
  s.email = %q{roy@wright.org}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    "LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION.yml",
    "examples/action.rb",
    "examples/command_widget.rb",
    "examples/dd_menu_action.rb",
    "examples/dd_menu_widget.rb",
    "examples/example_app.rb",
    "examples/index_action.rb",
    "examples/index_widget.rb",
    "examples/list_action.rb",
    "examples/list_widget.rb",
    "examples/nav.rb",
    "examples/ordered_list_action.rb",
    "examples/ordered_list_widget.rb",
    "examples/page_widget.rb",
    "examples/title_widget.rb",
    "lib/shoeshine.rb",
    "lib/shoeshine/drop_down_menu.rb",
    "lib/shoeshine/horizontal_rule.rb",
    "lib/shoeshine/list.rb",
    "lib/shoeshine/list_item.rb",
    "lib/shoeshine/widget.rb",
    "spec/drop_down_menu_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/royw/shoeshine}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{TODO}
  s.test_files = [
    "spec/spec_helper.rb",
    "spec/drop_down_menu_spec.rb",
    "examples/example_app.rb",
    "examples/dd_menu_action.rb",
    "examples/list_action.rb",
    "examples/nav.rb",
    "examples/title_widget.rb",
    "examples/dd_menu_widget.rb",
    "examples/ordered_list_widget.rb",
    "examples/ordered_list_action.rb",
    "examples/index_action.rb",
    "examples/list_widget.rb",
    "examples/index_widget.rb",
    "examples/page_widget.rb",
    "examples/action.rb",
    "examples/command_widget.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
