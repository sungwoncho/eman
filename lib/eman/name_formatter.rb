require "active_support/inflector"

module Eman
  class NameFormatter

    attr_accessor :type, :resource, :verb

    def initialize(resource, verb='', type)
      @type = type
      @resource = is_controller_name? ? resource.pluralize : resource
      @verb = verb
    end

    def camel_case!
      if is_model_name?
        "#{components_camelized}"
      else
        "#{components_camelized}#{type.capitalize}"
      end
    end

    def snake_case!
      if is_model_name?
        "#{components_snakified}"
      else
        "#{components_snakified}_#{type.downcase}"
      end
    end

    private

      def components
        [resource, verb].flat_map(&:split)
      end

      def components_camelized
        components.collect(&:capitalize).join
      end

      def components_snakified
        components.collect(&:downcase).join('_')
      end

      def is_controller_name?
        type == 'Controller'
      end

      def is_model_name?
        type == 'Model'
      end
  end
end
