
require 'encrubto/caesar/encryptor'

module Encrubto::Caesar
  
  def self.encrypt(str, offset)
    caesar = Encrubto::Caesar::Encryptor.new
    caesar.encrypt(str, offset)
  end

  def self.decrypt(encrypted, offset)
    caesar = Encrubto::Caesar::Encryptor.new
    caesar.decrypt(encrypted, offset)
  end
end
