module Cryptogram
  module Ciphers
    class Caesar
      def initialize(alphabet:, shift:, case_sensitive: true)
        @alphabet = alphabet
        @shift = shift
        @case_sensitive = case_sensitive
        @mapper = build_mapper
      end

      def encrypt(string)
        process(string) { |char| mapper.fetch(char, char) }
      end

      def decrypt(string)
        process(string) { |char| mapper.key(char) || char }
      end

      private

      attr_reader :alphabet, :shift, :case_sensitive, :mapper

      def build_mapper
        shifted_alphabet = alphabet.rotate(shift)

        Hash[alphabet.zip(shifted_alphabet)]
      end

      def process(string, &block)
        string.chars.map(&block).join
      end
    end
  end
end
