module DictionaryMacros
  def set_up_custom_dictionary
    # Custom dictionary files defined in spec/support/dictionary
    indices_file = YAML.load_file(File.expand_path('../dictionary/indices.yml', __FILE__))
    words_file = YAML.load_file(File.expand_path('../dictionary/words.yml', __FILE__))

    # Use a custom dictionary files for tests.
    allow(YAML).to receive(:load_file).with(File.expand_path('../../../lib/eman/dictionary/indices.yml', __FILE__)).and_return(indices_file)
    allow(YAML).to receive(:load_file).with(File.expand_path('../../../lib/eman/dictionary/words.yml', __FILE__)).and_return(words_file)
  end
end
