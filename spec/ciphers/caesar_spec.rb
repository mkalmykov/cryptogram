require 'spec_helper'

RSpec.describe Cryptogram::Ciphers::Caesar do
  let(:encriptor) { described_class.new(alphabet: alphabet, shift: shift) }
  let(:phrase) { 'pack my box with five dozen liquor jugs' }
  let(:alphabet) { Array('a'..'z') }

  shared_context 'with alphabetical chars' do
    let(:encrypted_phrase) { encriptor.encrypt(phrase) }

    it 'can encrypt' do
      expect(encrypted_phrase).to eq expected_cryptogram
    end

    it 'can decrypt' do
      expect(encriptor.decrypt(encrypted_phrase)).to eq phrase
    end
  end

  context 'when shift is less than alphabet length' do
    let(:shift) { alphabet.length - 1 }
    let(:expected_cryptogram) { 'ozbj lx anw vhsg ehud cnydm khptnq itfr' }

    include_context 'with alphabetical chars'
  end

  context 'when shift is greater than alphabet length' do
    let(:shift) { alphabet.length + 1 }
    let(:expected_cryptogram) { 'qbdl nz cpy xjui gjwf epafo mjrvps kvht' }

    include_context 'with alphabetical chars'
  end

  context 'when shift is equal to alphabet length' do
    let(:shift) { alphabet.length }
    let(:expected_cryptogram) { phrase }

    include_context 'with alphabetical chars'
  end
end
