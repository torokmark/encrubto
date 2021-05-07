require 'encrubto/base64/encryptor'

module Encrubto::Base64
  
  def self.encrypt(str, is_url)
    base64 = Encrubto::Base64::Encryptor.new
    base64.encrypt(str, is_url)
  end

  def self.decrypt(encrypted, is_url)
    base64 = Encrubto::Base64::Encryptor.new
    base64.decrypt(encrypted, is_url)
  end

end
    