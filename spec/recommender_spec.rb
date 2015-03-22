require "spec_helper"

RSpec.describe Eman::Recommender do

  before(:each) do
    @generator = Eman::Generator.new('Service')
    @generator.resource = 'Train Conductor'
    @generator.verb = 'Whistling'

    @formatter = Eman::Recommender.new(@generator)
  end

  describe '#inputs' do
    it 'returns the generators inputs' do
      expect(@formatter.inputs).to eq ['Train', 'Conductor', 'Whistling']
    end
  end

  describe '#words_hash' do
    it 'returns hash of words as keys and empty arrays as values' do
      expect(@formatter.words_hash).to eq({ 'Train' => [], 'Conductor' => [], 'Whistling' => [] })
    end
  end

  describe '#recommend_name' do
    it 'recommends a name' do
      set_up_custom_dictionary

      generator = Eman::Generator.new('Controller')
      generator.resource = 'deep'

      recommender = Eman::Recommender.new(generator)

      puts recommender.words_hash

      recommended_name = recommender.recommend_name

      puts recommender.words_hash
      expect(recommended_name.resource).to eq 'house'
    end
  end
end
