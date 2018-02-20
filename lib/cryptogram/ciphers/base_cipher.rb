module Cryptogram
  module Ciphers
    class BaseCipher
      def encrypt
        raise NotImplementedError
      end

      def decrypt
        raise NotImplementedError
      end
    end
  end
end
