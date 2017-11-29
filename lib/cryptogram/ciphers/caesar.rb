module Cryptogram
  module Ciphers
    class Caesar
      def initialize(alphabet:, shift:)
        @mapper = Mapper.new(alphabet: alphabet, shift: shift)
      end

      def encrypt(string)
        process(string) { |char| mapper.map_by_key(char) }
      end

      def decrypt(string)
        process(string) { |char| mapper.map_by_value(char) }
      end

      private

      attr_reader :alphabet, :shift, :mapper

      def process(string, &block)
        raise ArgumentError unless block_given?

        string.each_char.map(&block).join
      end
    end
  end

  class Mapper
    def initialize(alphabet:, shift:)
      @shift = shift

      @shifted_mapper = build_mapper(alphabet)
      @shifted_swapcased_mapper = build_mapper(alphabet.join.swapcase.chars)
    end

    def map_by_key(char)
      shifted_mapper.dig(char) || shifted_swapcased_mapper.dig(char) || char
    end

    def map_by_value(char)
      shifted_mapper.key(char) || shifted_swapcased_mapper.key(char) || char
    end

    private

    def build_mapper(alphabet)
      shifted_alphabet = alphabet.rotate(shift)

      Hash[alphabet.zip(shifted_alphabet)]
    end

    attr_reader :shift, :shifted_mapper, :shifted_swapcased_mapper
  end
end
