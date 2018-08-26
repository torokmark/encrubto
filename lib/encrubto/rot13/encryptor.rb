
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
      encrypt(encrypted)
    end
  end
end
