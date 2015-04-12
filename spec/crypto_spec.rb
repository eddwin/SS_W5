require './lib/credit_card.rb'
require'./lib/substitution_cipher.rb'
require 'minitest/autorun'

describe 'Test card info encryption' do
  before do
    @cc = CreditCard.new('4916603231464963', 'Mar-30-2020', 'Soumya Ray', 'Visa')
    @key = 3
  end

  describe 'Using Caeser cipher' do
    it 'should encrypt card information' do
      enc = SubstitutionCipher::Caeser.encrypt(@cc, @key)
      enc.wont_equal @cc.to_s
    end

    it 'should decrypt text' do
      enc = SubstitutionCipher::Caeser.encrypt(@cc, @key)
      dec = SubstitutionCipher::Caeser.decrypt(enc, @key)
      dec.must_equal @cc.to_s
    end
  end

  describe 'Using Permutation cipher' do
    it 'should encrypt card information' do
      enc = SubstitutionCipher::Permutation.encrypt(@cc, @key)
      enc.wont_equal @cc.to_s
    end

    it 'should decrypt text' do
      enc = SubstitutionCipher::Permutation.encrypt(@cc, @key)
      dec = SubstitutionCipher::Permutation.decrypt(enc, @key)
      dec.must_equal @cc.to_s
    end
  end

   describe 'Using Double Transposition cipher' do
    it 'should encrypt card information' do
      enc = SubstitutionCipher::DoubleTranspositionCipher.encrypt(@cc, @key)
      enc.wont_equal @cc.to_s
    end

    it 'should decrypt text' do
      enc = SubstitutionCipher::DoubleTranspositionCipher.encrypt(@cc, @key)
      dec = SubstitutionCipher::DoubleTranspositionCipher.decrypt(enc, @key)
      dec.must_equal @cc.to_s
    end
  end

  describe 'Using AesCipher cipher' do
    it 'should encrypt card information' do
      enc = SubstitutionCipher::AesCipher.encrypt(@cc, @key)
      enc.wont_equal @cc.to_s
    end

    it 'should decrypt text' do
      enc = SubstitutionCipher::AesCipher.encrypt(@cc, @key)
      dec = SubstitutionCipher::AesCipher.decrypt(enc, @key)
      dec.must_equal @cc.to_s
    end
  end


end
