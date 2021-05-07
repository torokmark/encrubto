require 'encrubto/morse/encryptor'

module Encrubto::Morse
  
  def self.encrypt(str)
    morse = Encrubto::Morse::Encryptor.new
    morse.encrypt(str)
  end

  def self.decrypt(encrypted)
    morse = Encrubto::Morse::Encryptor.new
    morse.decrypt(encrypted)
  end
end
