module Eman
  class Recommender

    attr_reader :generator

    def initialize(generator)
      @generator = generator
    end

    def inputs
      @inputs ||= @generator.inputs
    end

    def type
      @type ||= @generator.type
    end

    def words_hash
      @words_hash ||= Hash[ inputs.collect { |x| [x, []] } ]
    end

    def recommend_name
      fetch_similar_words
      assemble_words
    end

    private

      def fetch_similar_words
        inputs.each do |i|
          synonyms = Dictionary.find_similar(i)

          synonyms.each { |s| words_hash[i] << s } if synonyms.any?
        end
      end

      def assemble_words
        recommended_name = []

        if words_hash.values.flatten.length != inputs.length

          words_hash.each do |key, val|
            recommended_name << val.sample
          end

          if recommended_name.any?
            recommended = Eman::Generator.new(type)
            recommended.resource = recommended_name.join(' ')

            recommended
          end

        end
      end
  end
end
