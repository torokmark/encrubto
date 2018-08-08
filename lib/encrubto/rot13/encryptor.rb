
module Encrubto::Rot13
  class Encryptor 
  
    def encrypt(str)
      if str.is_a? String
        str.chars.map { |c|
          if ('a'..'z').include? c
                 
          elsif ('A'..'Z').include? c
            
          else
            c
          end
        }
      else
        raise 'Param must be String!'
      end
    end

    def decrypt(encrypted)
      puts "hola"
    end
  end
end
