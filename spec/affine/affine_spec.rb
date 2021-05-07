RSpec.describe Encrubto::Affine do

  describe 'call encrypt' do

    it 'returns "ihhwvc swfrcp" if input is ("Affine cipher", 5, 8)' do
      expect(Encrubto::Affine.encrypt("Affine cipher", 5, 8)).to eq("ihhwvc swfrcp")
    end

    it 'returns "exxyro wyjpob" if input is ("Affine cipher", 9, 4)' do
      expect(Encrubto::Affine.encrypt("Affine cipher", 9, 4)).to eq("exxyro wyjpob")
    end

    it 'raises ArgumentError if input is ("Affine cipher", 2, 4)' do
      expect { Encrubto::Affine.encrypt("Affine cipher", 2, 4) }.to raise_error(ArgumentError)
    end

  end

  describe 'call decrypt' do

    it 'returns "affine cipher" if input is ("ihhwvc swfrcp", 5, 8)' do
      expect(Encrubto::Affine.decrypt("ihhwvc swfrcp", 5, 8)).to eq("affine cipher")
    end

    it 'returns "affine cipher" if input is ("exxyro wyjpob", 9, 4)' do
      expect(Encrubto::Affine.decrypt("exxyro wyjpob", 9, 4)).to eq("affine cipher")
    end

    it 'raises ArgumentError if input is ("Affine cipher", 6, 4)' do
      expect { Encrubto::Affine.decrypt("exxyro wyjpob", 6, 4) }.to raise_error(ArgumentError)
    end

  end

end