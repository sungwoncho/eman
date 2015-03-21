require "spec_helper"

RSpec.describe Eman::Dictionary do

  # TODO: Stub custom YAML dictionary files for tests.
  describe '.find_similar' do
    it 'returns an array of similar words' do
      array = Eman::Dictionary.find_similar('user')
      expect(array).to be_an(Array)
      expect(array).to include 'customer'
    end
  end
end
