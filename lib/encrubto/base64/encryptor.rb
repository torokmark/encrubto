module Encrubto::Base64
  class Encryptor

    BASE64 = [
      'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
      'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
      'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
      'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
      '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '+', '/'
    ]

    def encrypt(str)
      result = ""
      byte_array = str.each_byte.to_a
      slices = byte_array.each_slice(3).to_a
      slices[0..-2].each {
        |slice|
        result = result + to_base64(slice)
      }
      if slices[-1].length == 3
        result = result + to_base64(slices[-1])
      elsif slices[-1].length == 1
        bit0 = slices[-1][0] & 0xff
        result = result + BASE64[bit0 >> 2]
        result = result + BASE64[(bit0 << 4) & 0x3f]
        result = result + "=="
      elsif slices[-1].length == 2
        bit0 = slices[-1][0] & 0xff
        result = result + BASE64[bit0 >> 2]
        bit1 = slices[-1][1] & 0xff;
        result = result + BASE64[(bit0 << 4) & 0x3f | (bit1 >> 4)]
        result = result + BASE64[(bit1 << 2) & 0x3f]
        result = result + "="
      end
      return result
    end

    def to_base64(slice)
      three_bytes = ((slice[0]) << 16) | ((slice[1]) << 8) | (slice[2] & 0xff)
      four_chars = BASE64[(three_bytes >> 18) & 0x3f] + 
        BASE64[(three_bytes >> 12) & 0x3f] + 
        BASE64[(three_bytes >> 6) & 0x3f] + 
        BASE64[three_bytes & 0x3f]
    end

  end
end