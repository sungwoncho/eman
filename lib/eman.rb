$:.unshift File.expand_path('../eman', __FILE__)

require "version"

module Eman
  autoload :Generator, 'generator'
  autoload :Formatter, 'formatter'
  autoload :Recommender, 'recommender'
  autoload :Dictionary, 'dictionary'
end
