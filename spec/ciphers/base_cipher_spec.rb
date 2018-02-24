require 'spec_helper'

RSpec.describe Cryptogram::Ciphers::BaseCipher do
  let(:instance) { described_class.new(alphabet: :english) }

  context 'Alphabet initialization' do
    let(:subject) { instance.send(:initialize_alphabet, alphabet) }

    context 'Custom alphabet' do
      let(:alphabet) { %w[a b c] }

      it { expect(subject).to eq alphabet }
    end

    context 'Existing preset name' do
      let(:alphabet) { :english }

      it { expect(subject).to eq Array('a'..'z') }
    end

    context 'Nonexistent preset name' do
      let(:alphabet) { :nonexistent_alphabet }

      it { expect { subject }.to raise_error(ArgumentError, /Unrecognized alphabet preset/) }
    end

    context 'Unsupported alphabet class' do
      let(:alphabet) { 'english' }

      it { expect { subject }.to raise_error(ArgumentError, /Unsupported alphabet class/) }
    end
  end
end
