require "spec_helper"

RSpec.describe Eman::Formatter do

  describe '#initialize' do
    context 'when type is controller' do
      it 'pluralizes the resource' do
        formatter = Eman::Formatter.new('Alarm clock', 'Operating', 'Controller')
        expect(formatter.resource).to eq 'Alarm clocks'
      end
    end

    context 'when type is not controller' do
      it 'does not pluralize the resource' do
        formatter = Eman::Formatter.new('Alarm clock', 'Operating', 'Service')
        expect(formatter.resource).to eq 'Alarm clock'
      end
    end
  end

  describe '#camel_case!' do
    it 'outsputs a camel cased name' do
      formatter = Eman::Formatter.new('cheese', 'grinding', 'Service')
      outcome = formatter.camel_case!

      expect(outcome).to eq 'CheeseGrindingService'
    end

    context 'when type is model' do
      it 'does not append the type at the end' do
        formatter = Eman::Formatter.new('Shopping', 'Cart', 'Model')
        outcome = formatter.camel_case!

        expect(outcome).to eq 'ShoppingCart'
      end
    end
  end

  describe '#snake_case!' do
    it 'outputs a snake cased name' do
      formatter = Eman::Formatter.new('guitar', 'smashing', 'Service')
      outcome = formatter.snake_case!

      expect(outcome).to eq 'guitar_smashing_service'
    end

    context 'when type is model' do
      it 'does not append the type at the end' do
        formatter = Eman::Formatter.new('Shopping', 'Cart', 'Model')
        outcome = formatter.snake_case!

        expect(outcome).to eq 'shopping_cart'
      end
    end
  end
end
