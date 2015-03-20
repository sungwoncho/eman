require "spec_helper"

RSpec.describe Eman::NameFormatter do

  describe '#initialize' do
    it 'breaks the components into smallest parts' do
      formatter = Eman::NameFormatter.new('Alarm clock', 'Operating', 'Controller')
      expect(formatter.components).to eq ['Alarm', 'clock', 'Operating']
    end
  end

  describe '#camel_case!' do
    it 'outsputs a camel cased name' do
      formatter = Eman::NameFormatter.new('cheese', 'grinding', 'service')
      outcome = formatter.camel_case!

      expect(outcome).to eq 'CheeseGrindingService'
    end
  end

  describe '#snake_case!' do
    it 'outputs a snake cased name' do
      formatter = Eman::NameFormatter.new('guitar', 'smashing', 'service')
      outcome = formatter.snake_case!

      expect(outcome).to eq 'guitar_smashing_service'
    end
  end
end
