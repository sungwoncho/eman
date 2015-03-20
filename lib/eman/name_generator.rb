module Eman
  class NameGenerator

    attr_accessor :resource, :verb
    attr_reader :type

    def initialize(type)
      @type = type
      @resource = ''
      @verb = ''
    end

    def run
      ask_resource
      ask_verb unless type == 'Controller'
      print_name
    end

    private

      def ask_resource
        puts "What is the resource that you are dealing with? (e.g. User, Session, Order, etc.)"
        @resource = $stdin.gets.chomp
      end

      def ask_verb
        puts "What is the primary action you are performing on this object/resource?"
        @verb = $stdin.gets.chomp
      end

      def print_name
        name = ::Eman::NameFormatter.new(@resource, @verb, @type).camel_case!

        puts "#{type} name : '#{name}'"
      end
  end
end
