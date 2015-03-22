module Eman
  class Generator

    attr_accessor :resource, :verb, :name, :recommended_name
    attr_reader :type

    def initialize(type)
      @type = type
    end

    def run
      ask_resource
      ask_verb if type == 'Service'
      generate_name
      print_name
    end

    def inputs
      [resource, verb].compact.flat_map(&:split)
    end

    private

      def ask_resource
        puts "What is the resource that you are dealing with? (e.g. User, Session, Order, etc.)"
        @resource = $stdin.gets.chomp.downcase
      end

      def ask_verb
        puts "What is the primary action you are performing on '#{resource}'?"
        @verb = $stdin.gets.chomp.downcase
      end

      def generate_name
        @name = Eman::Formatter.new(self).camel_case!
        @recommended_name = Eman::Recommender.new(self).recommend_name
      end

      def print_name
        puts "#{type} name : '#{name}'"
        puts "Further suggestion: '#{recommended_name}'" if recommended_name
      end
  end
end
