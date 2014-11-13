$: << '.'
require 'bundler/setup'
require 'krack'
require 'minitest/apidoc'
require 'minitest/autorun'

require_relative '../router'

def app; App end

include MiniTest::Apidoc::Methods

MiniTest::Apidoc::Template.output_file = File.expand_path("../doc/index.html", File.dirname(__FILE__))
MiniTest::Apidoc::Template.blurb = <<-HTML
  <h1>minitest-apidoc example</h1>
  <p>This is an example of the documentation generated by <a href="https://github.com/lauri/minitest-apidoc">minitest-apidoc</a>.</p>
HTML
