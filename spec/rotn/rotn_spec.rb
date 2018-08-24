RSpec.describe Encrubto::RotN do

  describe 'call encrypt' do
    it 'returns B if input is A and 1' do
      expect(Encrubto::RotN.encrypt('A', 1)).to eq('B')
    end

    it 'returns N if input is A and 39' do
      expect(Encrubto::RotN.encrypt('A', 39)).to eq('N')
    end

    it 'returns nCcYr if input is aPpLe and 39' do
      expect(Encrubto::RotN.encrypt('aPpLe', 39)).to eq('nCcYr')
    end

    it 'returns Z if input is A and -1' do
      expect(Encrubto::RotN.encrypt('A', -1)).to eq('Z')
    end

    it 'returns Z if input is A and -27' do
      expect(Encrubto::RotN.encrypt('A', -27)).to eq('Z')
    end

    it 'raises error if number of params is zero' do
      expect { Encrubto::RotN.encrypt }.to raise_error(ArgumentError)
    end

    it 'raises error if number of params is one' do
      expect { Encrubto::RotN.encrypt("A") }.to raise_error(ArgumentError)
    end

    it 'raises error if first param is not string' do
      expect { Encrubto::RotN.encrypt(1, 10) }.to raise_exception('First param must be String, second param must be Integer!')
    end

    it 'raises error if second param is not integer' do
      expect { Encrubto::RotN.encrypt("A", "B") }.to raise_exception('First param must be String, second param must be Integer!')
    end
  end

  describe 'call decrypt' do
    it 'returns A if input is B and 1' do
      expect(Encrubto::RotN.decrypt('B', 1)).to eq('A')
    end

    it 'returns A if input is N and 39' do
      expect(Encrubto::RotN.decrypt('N', 39)).to eq('A')
    end

    it 'returns aPpLe if input is nCcYr and 39' do
      expect(Encrubto::RotN.decrypt('nCcYr', 39)).to eq('aPpLe')
    end

    it 'returns A if input is Z and -1' do
      expect(Encrubto::RotN.decrypt('Z', -1)).to eq('A')
    end

    it 'returns A if input is Z and -27' do
      expect(Encrubto::RotN.decrypt('Z', -27)).to eq('A')
    end

    it 'raises error if number of params is zero' do
      expect { Encrubto::RotN.decrypt }.to raise_error(ArgumentError)
    end

    it 'raises error if number of params is one' do
      expect { Encrubto::RotN.decrypt("A") }.to raise_error(ArgumentError)
    end

    it 'raises error if first param is not string' do
      expect { Encrubto::RotN.decrypt(1, 10) }.to raise_exception('First param must be String, second param must be Integer!')
    end

    it 'raises error if second param is not integer' do
      expect { Encrubto::RotN.decrypt("A", "B") }.to raise_exception('First param must be String, second param must be Integer!')
    end
  end
end
