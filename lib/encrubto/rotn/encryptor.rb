module Encrubto::RotN
  class Encryptor
  
    ORIGINAL = 'abcdefghijklmnopqrstuvwxyz'

    def encrypt(str, offset)
      if str.is_a?(String) && offset.is_a?(Integer)
          rotn = shift(offset % 26)
          str.tr("#{ ORIGINAL }#{ ORIGINAL.upcase }", "#{ rotn }#{ rotn.to_s.upcase }")
      else
        raise 'First param must be String, second param must be Integer!'
      end
    end

    def decrypt(encrypted, offset)
      if encrypted.is_a?(String) && offset.is_a?(Integer)
        rotn = shift(offset % 26)
        encrypted.tr("#{ rotn }#{ rotn.to_s.upcase }", "#{ ORIGINAL }#{ ORIGINAL.upcase }")
      else
          raise 'First param must be String, second param must be Integer!'
      end
    end

    def shift(offset)
      firstPart = ORIGINAL[offset..ORIGINAL.length-1]
      secondPart = ORIGINAL[0..offset-1]
      rotn = firstPart.to_s + secondPart.to_s
    end

  end
end
