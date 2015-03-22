require "active_support/inflector"

module Eman
  class Formatter

    def initialize(generator)
      @generator = generator
    end

    def camel_case!
      if is_model_name?
        "#{inputs_camelized}"
      else
        "#{inputs_camelized}#{type.capitalize}"
      end
    end

    def snake_case!
      if is_model_name?
        "#{inputs_snakified}"
      else
        "#{inputs_snakified}_#{type.downcase}"
      end
    end

    private

      def inputs
        @generator.inputs
      end

      def type
        @generator.type
      end

      def inputs_camelized
        inputs.collect(&:capitalize).join
      end

      def inputs_snakified
        inputs.collect(&:downcase).join('_')
      end

      def is_model_name?
        type == 'Model'
      end
  end
end
