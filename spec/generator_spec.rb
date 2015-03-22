require "spec_helper"

RSpec.describe Eman::Generator do
  describe '#run' do
    context 'when type is service' do
      it 'should ask two questions' do
        generator = Eman::Generator.new('Service')
        allow($stdin).to receive(:gets) { 'Measure' }

        expect($stdin).to receive(:gets).twice
        generator.run
      end
    end

    context 'when type is not service' do
      it 'should ask one question' do
        generator = Eman::Generator.new('Controller')
        allow($stdin).to receive(:gets) { 'User' }

        expect($stdin).to receive(:gets).once
        generator.run
      end
    end
  end

  describe '#inputs' do
    it 'returns a flat array splited at spaces' do
      generator = Eman::Generator.new('Service')
      generator.resource = 'Alarm clock'
      generator.verb = 'reset'

      expect(generator.inputs).to eq ['Alarm', 'clock', 'reset']
    end
  end
end
