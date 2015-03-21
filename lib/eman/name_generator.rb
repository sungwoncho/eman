module Eman
  class NameGenerator

    attr_accessor :resource, :verb, :name
    attr_reader :type, :recommended_name

    def initialize(type)
      @type = type
      @resource = ''
      @verb = ''
      @name = ''
      @recommended_name = ''
    end

    def run
      ask_resource
      ask_verb if type == 'Service'
      generate_name
      print_name
    end

    private

      def ask_resource
        puts "What is the resource that you are dealing with? (e.g. User, Session, Order, etc.)"
        @resource = $stdin.gets.chomp
      end

      def ask_verb
        puts "What is the primary action you are performing on '#{resource}'?"
        @verb = $stdin.gets.chomp
      end

      def generate_name
        @name = ::Eman::NameFormatter.new(@resource, @verb, @type).camel_case!
        @recommended_name = ::Eman::Recommender.new(@resource, @verb, @type).recommend_name
      end

      def print_name
        puts "#{type} name : '#{name}'"
        puts "Further suggestion: #{recommended_name}" if recommended_name
      end
  end
end
