
require 'encrubto/base64/encryptor'

module Encrubto::Base64
  
  def self.encrypt(str)
    base64 = Encrubto::Base64::Encryptor.new
    base64.encrypt(str)
  end

  def self.decrypt(encrypted)
    base64 = Encrubto::Base64::Encryptor.new
    base64.decrypt(encrypted)
  end
end
    