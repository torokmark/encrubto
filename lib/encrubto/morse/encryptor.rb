module Encrubto::Morse
	class Encryptor

		ENCODE = {	" " => "/",
					"A" => ".-",
					"B" => "-...",
					"C" => "-.-.",
					"D" => "-..",
					"E" => ".",
					"F" => "..-.",
					"G" => "--.",
					"H" => "....",
					"I" => "..",
					"J" => ".---",
					"K" => "-.-",
					"L" => ".-..",
					"M" => "--",
					"N" => "-.",
					"O" => "---",
					"P" => ".--.",
					"Q" => "--.-",
					"R" => ".-.",
					"S" => "...",
					"T" => "-",
					"U" => "..-",
					"V" => "...-",
					"W" => ".--",
					"X" => "-..-",
					"Y" => "-.--",
					"Z" => "--..",
					"0" => "-----",
					"1" => ".----",
					"2" => "..---",
					"3" => "...--",
					"4" => "....-",
					"5" => ".....",
					"6" => "-....",
					"7" => "--...",
					"8" => "---..",
					"9" => "----.",
					"." => ".-.-.-",
					"," => "--..--",
					"?" => "..--..",
					"'" => ".----.",
					"!" => "-.-.--",
					"/" => "-..-.",
					"(" => "-.--.",
					")" => "-.--.-",
					"&" => ".-...",
					":" => "---...",
					";" => "-.-.-.",
					"=" => "-...-",
					"+" => ".-.-.",
					"-" => "-....-",
					"_" => "..--.-",
					"\"" => ".-..-.",
					"$" => "...-..-",
					"@" => ".--.-.",
		}
		DECODE = ENCODE.invert

		# Encrypts text using Morse code.
    #
    # @param plain_string [String] the text to encrypt
    # @return [String] the encoded message
		def encrypt(plain_string)
			cipher = plain_string.chars.map {|char| ENCODE.include?(char.upcase) ? ENCODE[char.upcase] : ""}
			cipher_string = cipher.join(' ')
			if !cipher_string.end_with?("/")
				cipher_string += "/"
			end
		end
		
		# Decrypts text in Morse code.
    #
    # @param cipher_string [String] the text to decrypt
    # @return [String] the decoded message
		def decrypt(cipher_string)
			words = cipher_string.split("/")
			split_words = words.map {|word| word.gsub("/", " ").split(" ")}
			decoded = split_words.map {|word| word.map {|letter| DECODE.include?(letter) ? DECODE[letter] : "_"}.join('')}.join(' ')
		end

	end
end
