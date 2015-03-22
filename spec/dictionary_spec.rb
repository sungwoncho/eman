require "spec_helper"

RSpec.describe Eman::Dictionary do

  describe '.find_similar' do
    it 'returns an array of similar words' do
      set_up_custom_dictionary

      array = Eman::Dictionary.find_similar('user')
      expect(array).to eq ['user', 'customer']
    end
  end
end
