module Encrubto::Affine
  class Encryptor

    ALPHABET_SIZE = 26
    ASCII_LOWER_A = 'a'.ord
    
    # Encrypts text using the Affine cipher.
    #
    # @param plain_string [String] the text to encrypt
    # @param a [Integer] the first key
    # @param b [Integer] the second key
    # @return [String] the encrypted text
    # @raise [ArgumentError] if the first key is not coprime with the alphabet size
    def encrypt(plain_string, a=5, b=8)
      cipher_table = encrypt_alphabet(a, b)
      cipher_string = encode(plain_string, cipher_table)
    end
    
    # Decrypts text using the Affine cipher.
    #
    # @param plain_string [String] the text to decrypt
    # @param a [Integer] the first key
    # @param b [Integer] the second key
    # @return [String] the decrypted text
    # @raise [ArgumentError] if the first key is not coprime with the alphabet size
    def decrypt(cipher_string, a=5, b=8)
      cipher_table = decrypt_alphabet(a,b)
      plain_string = encode(cipher_string, cipher_table)
    end
    
      private
    
      def encrypt_alphabet(a, b)
        a_inv = modular_inverse(a, ALPHABET_SIZE)
        cipher_table = []
        for i in 0..ALPHABET_SIZE-1 do
          cipher_table << (((a*i+b) % ALPHABET_SIZE) + ASCII_LOWER_A).chr
        end
        cipher_table
      end
      
      def decrypt_alphabet(a, b)
        a_inv = modular_inverse(a, ALPHABET_SIZE)
        cipher_table = []
        for i in 0..ALPHABET_SIZE-1 do
          cipher_table << (((a_inv*(i-b)) % ALPHABET_SIZE) + ASCII_LOWER_A).chr
        end
        cipher_table
      end
      
      def modular_inverse(a, m)
        x,y, u,v = 0,1, 1,0
        while a != 0 do
          q, r = m/a, m%a
          g, h = x-u*q, y-v*q
          m,a, x,y, u,v = a,r, u,v, g,h
        end
        gcd = m
        if gcd != 1
          raise ArgumentError.new("The first argument must be coprime with alphabet size (#{ALPHABET_SIZE}).")
        else
          modinv = x % g
        end
      end

      def encode(str, cipher_table)
        enc_str = str.chars.map do |char|
          if cipher_table.include?(char.downcase)
            cipher_table[char.downcase.ord - ASCII_LOWER_A]
          else
            char
          end
        end.join('')
      end

  end
end