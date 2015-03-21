require "spec_helper"

RSpec.describe Eman::Formatter do

  describe '#camel_case!' do
    it 'outsputs a camel cased name' do
      generator = Eman::Generator.new('Service')
      generator.resource = 'Cheese Cake'
      generator.verb = 'Grinding'
      formatter = Eman::Formatter.new(generator)
      outcome = formatter.camel_case!

      expect(outcome).to eq 'CheeseCakeGrindingService'
    end

    context 'when type is model' do
      it 'does not append the type at the end' do
        generator = Eman::Generator.new('Model')
        generator.resource = 'Shopping Cart'
        formatter = Eman::Formatter.new(generator)
        outcome = formatter.camel_case!

        expect(outcome).to eq 'ShoppingCart'
      end
    end
  end

  describe '#snake_case!' do
    it 'outputs a snake cased name' do
      generator = Eman::Generator.new('Service')
      generator.resource = 'Cheese Cake'
      generator.verb = 'Grinding'
      formatter = Eman::Formatter.new(generator)
      outcome = formatter.snake_case!

      expect(outcome).to eq 'cheese_cake_grinding_service'
    end

    context 'when type is model' do
      it 'does not append the type at the end' do
        generator = Eman::Generator.new('Model')
        generator.resource = 'Shopping Cart'
        formatter = Eman::Formatter.new(generator)
        outcome = formatter.snake_case!

        expect(outcome).to eq 'shopping_cart'
      end
    end
  end
end
