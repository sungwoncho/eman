module Eman
  class Recommender

    attr_accessor :words_hash, :type
    attr_reader :name_generator, :words

    def initialize(*words, type)
      @type = type
      @words = words.flat_map(&:split)
      @words_hash = Hash.new
      set_words_hash
    end

    def recommend_name
      fetch_similar_words
      assemble_words
    end

    private

      def set_words_hash
        @words.each { |w| words_hash[w] = Array.new [w] }
      end

      def fetch_similar_words
        @words.each do |w|
          synonyms = Dictionary.find_similar(w)

          synonyms.each { |s| @words_hash[w] << s } if synonyms.any?
        end
      end

      def assemble_words
        recommended_name = []

        @words_hash.each do |key, val|
          recommended_name << val.sample
        end

        recommended_name || []
      end
  end
end
