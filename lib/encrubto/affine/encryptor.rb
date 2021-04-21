module Encrubto::Affine
  class Encryptor

    ALPHABET_SIZE = 26
    ASCII_LOWER_A = 'a'.ord
    
    def encrypt(plain_string, a=5, b=8)
      cipher_table = encrypt_alphabet(a, b)
      cipher_string = plain_string.chars.map do |char|
        if cipher_table.include?(char.downcase)
          cipher_table[char.downcase.ord - ASCII_LOWER_A]
        else
          char
        end
      end.join('')
    end
    
    def decrypt(cipher_string, a=5, b=8)
      cipher_table = decrypt_alphabet(a,b)
      plain_string = cipher_string.chars.map do |char|
        if cipher_table.include?(char.downcase)
          cipher_table[char.downcase.ord - ASCII_LOWER_A]
        else
          char
        end
      end.join('')
    end
    
      private
    
      def encrypt_alphabet(a, b)
        a_inv = modinv(a, ALPHABET_SIZE)
        cipher_table = []
        for i in 0..ALPHABET_SIZE-1 do
          cipher_table << (((a*i+b) % ALPHABET_SIZE) + ASCII_LOWER_A).chr
        end
        cipher_table
      end
      
      def decrypt_alphabet(a, b)
        a_inv = modinv(a, ALPHABET_SIZE)
        cipher_table = []
        for i in 0..ALPHABET_SIZE-1 do
          cipher_table << (((a_inv*(i-b)) % ALPHABET_SIZE) + ASCII_LOWER_A).chr
        end
        cipher_table
      end
      
      def modinv(a, m)
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

  end
end