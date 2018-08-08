
require 'encrubto/rot13/encryptor'

module Encrubto::Rot13
  
  def self.encrypt(str)
    rot13 = Encrubto::Rot13::Encryptor.new
    rot13.encrypt(str)
  end

  def self.decrypt(encrypted)
    rot13 = Encrubto::Rot13::Encryptor.new
    rot13.decrypt(encrypted)
  end
end
