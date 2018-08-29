RSpec.describe Encrubto::Base64 do

  describe 'call encrypt' do
    it 'returns 97 if input is ab' do
      expect(Encrubto::Base64.encrypt('ab')).to eq(97)
    end
  end

end