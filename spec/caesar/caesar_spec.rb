RSpec.describe Encrubto::Caesar do

    describe 'call encrypt' do
      it 'returns B if input is A' do
        expect(Encrubto::Caesar.encrypt('A', 1)).to eq('B')
      end

      it 'returns N if input is A' do
        expect(Encrubto::Caesar.encrypt('A', 13)).to eq('N')
      end
  
      it 'returns nCcYr if input is aPpLe' do
        expect(Encrubto::Caesar.encrypt('aPpLe', 13)).to eq('nCcYr')
      end
  
      it 'raises error if number of params is zero' do
        expect { Encrubto::Caesar.encrypt }.to raise_error(ArgumentError)
      end

      it 'raises error if number of params is one' do
        expect { Encrubto::Caesar.encrypt("A") }.to raise_error(ArgumentError)
      end
  
      it 'raises error if first param is not string' do
        expect { Encrubto::Caesar.encrypt(1, 10) }.to raise_exception('First param must be String, second param must be Integer!')
      end

      it 'raises error if second param is not integer' do
        expect { Encrubto::Caesar.encrypt("A", "B") }.to raise_exception('First param must be String, second param must be Integer!')
      end

      it 'raises error if second param is not in the range 0-26' do
        expect { Encrubto::Caesar.encrypt("A", 123) }.to raise_exception('Offset must be between 0 and 26!')
      end

    end
  
    describe 'call decrypt' do
      it 'returns A if input is B' do
        expect(Encrubto::Caesar.decrypt('B', 1)).to eq('A')
      end

      it 'returns A if input is N' do
        expect(Encrubto::Caesar.decrypt('N', 13)).to eq('A')
      end
  
      it 'returns aPpLe if input is nCcYr' do
        expect(Encrubto::Caesar.decrypt('nCcYr', 13)).to eq('aPpLe')
      end
  
      it 'raises error if number of params is zero' do
        expect { Encrubto::Caesar.decrypt }.to raise_error(ArgumentError)
      end

      it 'raises error if number of params is one' do
        expect { Encrubto::Caesar.decrypt("A") }.to raise_error(ArgumentError)
      end
  
      it 'raises error if first param is not string' do
        expect { Encrubto::Caesar.decrypt(1, 10) }.to raise_exception('First param must be String, second param must be Integer!')
      end

      it 'raises error if second param is not integer' do
        expect { Encrubto::Caesar.decrypt("A", "B") }.to raise_exception('First param must be String, second param must be Integer!')
      end

      it 'raises error if second param is not in the range 0-26' do
        expect { Encrubto::Caesar.decrypt("A", 123) }.to raise_exception('Offset must be between 0 and 26!')
      end
    end
  end
  