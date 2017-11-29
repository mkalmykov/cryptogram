require 'cryptogram/mapper'

module Cryptogram
  module Ciphers
    class Caesar
      def initialize(alphabet:, shift:)
        @mapper = ::Cryptogram::Mapper.new(alphabet: alphabet, shift: shift)
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
end
