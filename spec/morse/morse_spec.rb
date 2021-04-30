RSpec.describe Encrubto::Morse do

  describe 'call encrypt' do
    it 'returns "... -- ... ----- .-.-.- / ... -- ... ..--../" if input is "sms0. sms?"' do
      expect(Encrubto::Morse.encrypt("sms0. sms?")).to eq("... -- ... ----- .-.-.- / ... -- ... ..--../")
    end

    it 'returns "----- ...- -... ---... --..--/" if input is "0vb:,"' do
      expect(Encrubto::Morse.encrypt("0vb:,")).to eq("----- ...- -... ---... --..--/")
    end

    it 'returns ".. -. / - .... . / --. .- .-. -.. . -./" if input is "in the garden"' do
      expect(Encrubto::Morse.encrypt("in the garden")).to eq(".. -. / - .... . / --. .- .-. -.. . -./")
    end
  end

  describe 'call decrypt' do
    it 'returns "SMS0. SMS?" if input is "... -- ... ----- .-.-.- / ... -- ... ..--../"' do
      expect(Encrubto::Morse.decrypt("... -- ... ----- .-.-.- / ... -- ... ..--../")).to eq("SMS0. SMS?")
    end

    it 'returns "0VB:," if input is "----- ...- -... ---... --..--/"' do
      expect(Encrubto::Morse.decrypt("----- ...- -... ---... --..--/")).to eq("0VB:,")
    end

    it 'returns "IN THE GARDEN" if input is ".. -. / - .... . / --. .- .-. -.. . -./"' do
      expect(Encrubto::Morse.decrypt(".. -. / - .... . / --. .- .-. -.. . -./")).to eq("IN THE GARDEN")
    end
  end

end