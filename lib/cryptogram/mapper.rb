module Cryptogram
  class Mapper
    def initialize(alphabet:, shift:)
      @shift = shift

      @mapper = build_mapper(alphabet)
      @swapcased_mapper = build_mapper(alphabet.join.swapcase.chars)
    end

    def map_to_shifted(char)
      @mapper.dig(char) || @swapcased_mapper.dig(char) || char
    end

    def map_to_initial(char)
      @mapper.key(char) || @swapcased_mapper.key(char) || char
    end

    private

    def build_mapper(alphabet)
      shifted_alphabet = alphabet.rotate(@shift)

      Hash[alphabet.zip(shifted_alphabet)]
    end
  end
end
