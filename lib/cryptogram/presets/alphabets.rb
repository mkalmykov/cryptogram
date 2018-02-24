module Cryptogram
  module Presets
    module Alphabets
      ALPHABETS = {
        english:  Array('a'..'z'),
        russian: Array('а'..'я')
      }.freeze

      class << self
        def fetch(alphabet_name)
          ALPHABETS.fetch(alphabet_name) do
            raise ArgumentError, "Unrecognized alphabet preset: #{alphabet_name}"
          end
        end
      end
    end
  end
end
