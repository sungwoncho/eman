$:.unshift File.expand_path('../eman', __FILE__)

require "eman/version"

module Eman
  autoload :NameGenerator, 'name_generator'
end
