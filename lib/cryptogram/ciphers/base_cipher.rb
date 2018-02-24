require 'cryptogram/presets/alphabets'

module Cryptogram
  module Ciphers
    class BaseCipher
      #
      # @param [Array, Symbol] alphabet Array of chars or presetted alphabet name
      def initialize(alphabet:)
        @alphabet = initialize_alphabet(alphabet)
      end

      def encrypt
        raise NotImplementedError
      end

      def decrypt
        raise NotImplementedError
      end

      private

      def initialize_alphabet(alphabet)
        case alphabet
        when Array
          alphabet
        when Symbol
          Cryptogram::Presets::Alphabets.fetch(alphabet)
        else
          raise ArgumentError, "Unsupported alphabet class: #{alphabet.class}"
        end
      end
    end
  end
end
