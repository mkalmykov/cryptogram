require 'spec_helper'

RSpec.describe Cryptogram::Ciphers::Caesar do
  let(:encriptor) { described_class.new(shift: shift) }
  let(:phrase) { 'pack my box with five dozen liquor jugs' }

  shared_context 'with alphabetical chars' do
    let(:encrypted_phrase) { encriptor.encrypt(phrase) }

    it 'can encrypt' do
      expect(encrypted_phrase).to eq expected_encrypted_phrase
    end

    it 'can decrypt' do
      expect(encriptor.decrypt(encrypted_phrase)).to eq phrase
    end
  end

  context 'when shift is less than alphabet length' do
    let(:shift) { Cryptogram::ALPHABET.length - 1 }
    let(:expected_encrypted_phrase) { 'ozbj lx anw vhsg ehud cnydm khptnq itfr' }

    include_context 'with alphabetical chars'
  end

  context 'when shift is greater than alphabet length' do
    let(:shift) { Cryptogram::ALPHABET.length + 1 }
    let(:expected_encrypted_phrase) { 'qbdl nz cpy xjui gjwf epafo mjrvps kvht' }

    include_context 'with alphabetical chars'
  end

  context 'when shift is equal to alphabet length' do
    let(:shift) { Cryptogram::ALPHABET.length }
    let(:expected_encrypted_phrase) { phrase }

    include_context 'with alphabetical chars'
  end
end
