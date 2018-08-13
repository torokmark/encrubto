
module Encrubto::Rot13
  class Encryptor 
  
    ORI = 'abcdefghijklmnopqrstuvwxyz'
    ROT = 'nopqrstuvwxyzabcdefghijklm'
    def encrypt(str)
      if str.is_a? String
        str.tr("#{ ORI }#{ ORI.upcase }", "#{ ROT }#{ ROT.upcase }")
      else
        raise 'Param must be String!'
      end
    end

    def decrypt(encrypted)
      if encrypted.is_a? String
        encrypted.tr("#{ ROT }#{ ROT.upcase }", "#{ ORI }#{ ORI.upcase }")
      else
        raise 'Param must be String!'
      end
    end
  end
end
