require "yaml"

module Eman
  class Dictionary

    INDICES_FILE = File.expand_path('../dictionary/indices.yml', __FILE__)
    WORDS_FILE = File.expand_path('../dictionary/words.yml', __FILE__)

    def self.find_similar(w)
      index = fetch_index(w)
      fetch_words(index)
    end

    private

      def self.fetch_index(key)
        indices = YAML.load_file(INDICES_FILE)
        indices[key]
      end

      def self.fetch_words(index)
        words_list = YAML.load_file(WORDS_FILE)
        words_list[index] || []
      end

  end
end
