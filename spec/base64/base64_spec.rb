RSpec.describe Encrubto::Base64 do

  describe 'call encrypt' do
    it 'returns YWFh if input is aaa' do
      expect(Encrubto::Base64.encrypt('aaa')).to eq('YWFh')
    end
    it 'returns YWFhYWFh if input is aaaaaa' do
      expect(Encrubto::Base64.encrypt('aaaaaa')).to eq('YWFhYWFh')
    end
    it 'returns YWFhYWE= if input is aaaaa' do
      expect(Encrubto::Base64.encrypt('aaaaa')).to eq('YWFhYWE=')
    end
    it 'returns YWFhYQ== if input is aaaa' do
      expect(Encrubto::Base64.encrypt('aaaa')).to eq('YWFhYQ==')
    end
    it 'returns "YmFzZTY0IHRlc3QgdGV4dA==" if input is "base64 test text"' do
      expect(Encrubto::Base64.encrypt('base64 test text')).to eq('YmFzZTY0IHRlc3QgdGV4dA==')
    end
    it 'returns "MTIz" if input is "123"' do
      expect(Encrubto::Base64.encrypt('123')).to eq('MTIz')
    end
    it 'returns "PQ==" if input is "="' do
      expect(Encrubto::Base64.encrypt('=')).to eq('PQ==')
    end
  end

  describe 'call decrypt' do
    it 'returns aaa if input is YWFh' do
     expect(Encrubto::Base64.decrypt('YWFh')).to eq('aaa')
    end
 end

end