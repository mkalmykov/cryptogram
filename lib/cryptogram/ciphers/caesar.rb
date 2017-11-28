module Cryptogram
  module Ciphers
    class Caesar
      attr_reader :shift, :mapper

      def initialize(shift:)
        @shift = shift
        @mapper = build_mapper
      end

      def encrypt(string)
        string.chars.map { |char| mapper.fetch(char, char) }.join
      end

      def decrypt(string)
        string.chars.map { |char| mapper.key(char) || char }.join
      end

      private

      def build_mapper
        shifted_alphabet = ::Cryptogram::ALPHABET.rotate(shift)

        Hash[::Cryptogram::ALPHABET.zip(shifted_alphabet)]
      end
    end
  end
end
