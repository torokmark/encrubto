module Encrubto::Base64
  class Encryptor

    BASE64_CHARS = [*'A'..'Z', *'a'..'z', *'0'..'9', '+', '/']
    BASE64_URL_CHARS = [*'A'..'Z', *'a'..'z', *'0'..'9', '-', '_']
    PADDING = "="

    # Encodes input using Base64 encoding.
    #
    # @param data [String] the data to encrypt
    # @param is_url [Boolean] whether data is url
    # @return [String] the encoded text
    def encrypt(data, is_url=false)
      bin_array = to_bin(data)
      dec_array = bin_to_dec(bin_array)
      enc_str = dec_to_str(dec_array, is_url)
      pad_enc_str = add_padding(enc_str)
    end
    
    # Decodes Base64 encoded input.
    #
    # @param encoded_string [String] the data to decode
    # @param is_url [Boolean] whether encoded data is url
    # @return [String] the decoded data
    def decrypt(encoded_string, is_url=false)
      enc_str = remove_padding(encoded_string)
      dec_array = str_to_dec(enc_str, is_url)
      bin_array = dec_to_bin(dec_array)
      pln_str = bin_to_str(bin_array)
    end
    
    private

      def generate_encoding_table(chars)
        Hash[chars.each_with_index.collect {|v, i| [i, v]}]
      end
    
      def to_bin(data)
        bin_array = data.unpack("B*")[0].scan(/.{1,6}/)
      end

      def bin_to_dec(bin_array)
        dec_array = bin_array.map {|bin| bin.ljust(6, "0").to_i(2)}
      end

      def dec_to_str(dec_array, is_url)
        encoding_table = is_url ? generate_encoding_table(BASE64_URL_CHARS) : generate_encoding_table(BASE64_CHARS)
        str = dec_array.map {|num| encoding_table[num]}.join('')
      end
    
      def add_padding(str)
        if str.bytesize % 4 == 3
          str += PADDING
        elsif str.bytesize % 4 == 2
          str += PADDING * 2
        end
        str
      end
      
      def remove_padding(str)
        str.sub(/=+/, '')
      end

      def str_to_dec(str, is_url)
        encoding_table = is_url ? generate_encoding_table(BASE64_URL_CHARS) : generate_encoding_table(BASE64_CHARS)
        reverse_encoding_table = encoding_table.invert
        dec = str.chars.map {|char| reverse_encoding_table[char]}
      end

      def dec_to_bin(dec_array)
        bin_array = dec_array.map {|num| "%06b" % num}.join('').scan(/.{8}/)
      end

      def bin_to_str(bin_array)
        str = bin_array.map {|bin| bin.to_i(2).chr}.join('')
      end

  end
end