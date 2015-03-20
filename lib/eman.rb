$:.unshift File.expand_path('../eman', __FILE__)

require "version"
# require "name_formatter"

module Eman
  autoload :NameGenerator, 'name_generator'
  autoload :NameFormatter, 'name_formatter'
end
