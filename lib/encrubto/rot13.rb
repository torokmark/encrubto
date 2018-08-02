
require 'encrubto/rot13/helper'

module Encrubto::Rot13
  
  def self.encrypt(str)
    Encrubto::Rot13::Helper.encrypt(str)
  end

  def self.decrypt(encrypted)
    Encrubto::Rot13::Helper.decrypt(encrypted)
  end
end
