module Encrubto::Caesar
    class Encryptor 
    
      ORIGINAL = 'abcdefghijklmnopqrstuvwxyz'

      def encrypt(str, offset)
        if str.is_a?(String) && offset.is_a?(Integer)
          if 0 <= offset && offset <= 26
            caesar = shift(offset)
            str.tr("#{ ORIGINAL }#{ ORIGINAL.upcase }", "#{ caesar }#{ caesar.to_s.upcase }")
          else
            raise 'Offset must be between 0 and 26!'
          end
        else
          raise 'First param must be String, second param must be Integer!'
        end
      end
  
      def decrypt(encrypted, offset)
        if encrypted.is_a?(String) && offset.is_a?(Integer)
          if 0 <= offset && offset <= 26
            caesar = shift(offset)
            encrypted.tr("#{ caesar }#{ caesar.to_s.upcase }", "#{ ORIGINAL }#{ ORIGINAL.upcase }")
          else
            raise 'Offset must be between 0 and 26!'
          end
        else
            raise 'First param must be String, second param must be Integer!'
        end
      end

      def shift(offset)
        caesarFirstPart = ORIGINAL[offset..ORIGINAL.length-1]
        caesarSecondPart = ORIGINAL[0..offset-1]
        caesar = caesarFirstPart.to_s + caesarSecondPart.to_s
      end

    end
  end
  