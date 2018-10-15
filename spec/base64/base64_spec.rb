RSpec.describe Encrubto::Base64 do

  describe 'call encrypt' do
    it 'returns YWFh if input is aaa' do
      expect(Encrubto::Base64.encrypt('aaa', false)).to eq('YWFh')
    end
    it 'returns YWFhYWFh if input is aaaaaa' do
      expect(Encrubto::Base64.encrypt('aaaaaa', false)).to eq('YWFhYWFh')
    end
    it 'returns YWFhYWE= if input is aaaaa' do
      expect(Encrubto::Base64.encrypt('aaaaa', false)).to eq('YWFhYWE=')
    end
    it 'returns YWFhYQ== if input is aaaa' do
      expect(Encrubto::Base64.encrypt('aaaa', false)).to eq('YWFhYQ==')
    end
    it 'returns "YmFzZTY0IHRlc3QgdGV4dA==" if input is "base64 test text"' do
      expect(Encrubto::Base64.encrypt('base64 test text', false)).to eq('YmFzZTY0IHRlc3QgdGV4dA==')
    end
    it 'returns "MTIz" if input is "123"' do
      expect(Encrubto::Base64.encrypt('123', false)).to eq('MTIz')
    end
    it 'returns "PQ==" if input is "="' do
      expect(Encrubto::Base64.encrypt('=', false)).to eq('PQ==')
    end
  end

  describe 'call decrypt' do
    it 'returns aaa if input is YWFh' do
     expect(Encrubto::Base64.decrypt('YWFh', false)).to eq('aaa')
    end
    it 'returns aaaaaa if input is YWFhYWFh' do
      expect(Encrubto::Base64.decrypt('YWFhYWFh', false)).to eq('aaaaaa')
    end
    it 'returns aaaaa if input is YWFhYWE=' do
      expect(Encrubto::Base64.decrypt('YWFhYWE=', false)).to eq('aaaaa')
    end
    it 'returns aaaa if input is YWFhYQ==' do
      expect(Encrubto::Base64.decrypt('YWFhYQ==', false)).to eq('aaaa')
    end
    it 'returns "base64 test text" if input is "YmFzZTY0IHRlc3QgdGV4dA=="' do
      expect(Encrubto::Base64.decrypt('YmFzZTY0IHRlc3QgdGV4dA==', false)).to eq('base64 test text')
    end
    it 'returns 123 if input is MTIz' do
      expect(Encrubto::Base64.decrypt('MTIz', false)).to eq('123')
    end
    it 'returns = if input is PQ==' do
      expect(Encrubto::Base64.decrypt('PQ==', false)).to eq('=')
    end
 end

end