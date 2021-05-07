require 'encrubto/affine/encryptor'

module Encrubto::Affine
  
  def self.encrypt(plain_string, a, b)
    affine = Encrubto::Affine::Encryptor.new
    affine.encrypt(plain_string, a, b)
  end

  def self.decrypt(cipher_string, a, b)
    affine = Encrubto::Affine::Encryptor.new
    affine.decrypt(cipher_string, a, b)
  end
  
end