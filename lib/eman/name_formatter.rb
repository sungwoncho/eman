module Eman
  class NameFormatter

    attr_accessor :components, :type

    def initialize(*components, type)
      @components = components.map(&:split).flatten
      @type = type
    end

    def camel_case!
      "#{components_camelized}#{type.capitalize}"
    end

    def snake_case!
      "#{components_snakified}_#{type.downcase}"
    end

    private

      def components_camelized
        @components.collect(&:capitalize).join
      end

      def components_snakified
        @components.collect(&:downcase).join('_')
      end
  end
end
