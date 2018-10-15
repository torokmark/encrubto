module Encrubto::Base64
  class Encryptor

    BASE64 = [
      'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
      'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
      'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
      'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
      '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '+', '/'
    ]

    BASE64_URL = [
      'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
      'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
      'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
      'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
      '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '-', '_'
    ]

    def encrypt(str, is_url)
      result = ""
      byte_array = str.each_byte.to_a
      slices = byte_array.each_slice(3).to_a
      slices[0..-2].each { |slice|
        result = result + to_base64(slice, is_url)
      }
      result = result + to_base64_last_slice(slices[-1], is_url)
    end

    def decrypt(str, is_url)
      result = ""
      byte_array = str.each_byte.to_a
      slices = byte_array.each_slice(4).to_a
      slices.each { |slice|
        result = result + from_base64(slice, is_url)
      }
      return result
    end

    def to_base64(byte_array, is_url)
      bits = byte_array[0] << 16 | byte_array[1] << 8 | byte_array[2]
      if is_url == true
        chars = BASE64_URL[bits >> 18 & 0x3f] + 
          BASE64_URL[bits >> 12 & 0x3f] + 
          BASE64_URL[bits >> 6 & 0x3f] + 
          BASE64_URL[bits & 0x3f]
      else
        chars = BASE64[bits >> 18 & 0x3f] + 
          BASE64[bits >> 12 & 0x3f] + 
          BASE64[bits >> 6 & 0x3f] + 
          BASE64[bits & 0x3f]
      end
    end

    def to_base64_last_slice(byte_array, is_url)
      chars = ""
      if is_url == true
        if byte_array.length == 3
          chars = chars + to_base64(byte_array, is_url)
        elsif byte_array.length == 1
          bit0 = byte_array[0] & 0xff
          chars = chars + BASE64_URL[bit0 >> 2]
          chars = chars + BASE64_URL[bit0 << 4 & 0x3f]
          chars = chars + "=="
        elsif byte_array.length == 2
          bit0 = byte_array[0] & 0xff
          chars = chars + BASE64_URL[bit0 >> 2]
          bit1 = byte_array[1] & 0xff;
          chars = chars + BASE64_URL[bit0 << 4 & 0x3f | bit1 >> 4]
          chars = chars + BASE64_URL[bit1 << 2 & 0x3f]
          chars = chars + "="
        end
      else
        if byte_array.length == 3
          chars = chars + to_base64(byte_array, is_url)
        elsif byte_array.length == 1
          bit0 = byte_array[0] & 0xff
          chars = chars + BASE64[bit0 >> 2]
          chars = chars + BASE64[bit0 << 4 & 0x3f]
          chars = chars + "=="
        elsif byte_array.length == 2
          bit0 = byte_array[0] & 0xff
          chars = chars + BASE64[bit0 >> 2]
          bit1 = byte_array[1] & 0xff;
          chars = chars + BASE64[bit0 << 4 & 0x3f | bit1 >> 4]
          chars = chars + BASE64[bit1 << 2 & 0x3f]
          chars = chars + "="
        end
      end
    end

    def from_base64(base64_chars, is_url)
      base64_indexes = []
      base64_chars.each { |char|
        if char.chr != "="
          if is_url == true
            base64_indexes.push(BASE64_URL.find_index(char.chr))
          else
            base64_indexes.push(BASE64.find_index(char.chr))
          end
        else
          base64_indexes.push(char)
        end
      }
      if base64_indexes[2].chr == "=" && base64_indexes[3].chr == "="
        bits = base64_indexes[0] << 6 | base64_indexes[1]
        chars = (bits >> 4 & 0xff).chr
      elsif base64_indexes[3].chr == "="
        bits = base64_indexes[0] << 12 | base64_indexes[1] << 6 | base64_indexes[2]
        chars = (bits >> 10 & 0xff).chr + (bits >> 2 & 0xff).chr
      else
        bits = base64_indexes[0] << 18 | base64_indexes[1] << 12 | base64_indexes[2] << 6 | base64_indexes[3]
        chars = (bits >> 16 & 0xff).chr + (bits >> 8 & 0xff).chr + (bits & 0xff).chr
      end
    end

  end
end