$:.unshift File.expand_path('../eman', __FILE__)

require "version"

module Eman
  autoload :NameGenerator, 'name_generator'
  autoload :NameFormatter, 'name_formatter'
  autoload :Recommender, 'recommender'
  autoload :Dictionary, 'dictionary'
end
