require "spec_helper"

RSpec.describe Eman::NameFormatter do

  context 'when type is controller' do
    describe '#initialize' do
      it 'pluralizes the resource' do
        formatter = Eman::NameFormatter.new('Alarm clock', 'Operating', 'Controller')
        expect(formatter.resource).to eq 'Alarm clocks'
      end
    end
  end

  context 'when type is not controller' do
    describe '#initialize' do
      it 'does not pluralize the resource' do
        formatter = Eman::NameFormatter.new('Alarm clock', 'Operating', 'Service')
        expect(formatter.resource).to eq 'Alarm clock'
      end
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
