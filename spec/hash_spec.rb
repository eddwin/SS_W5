require './lib/credit_card.rb'
require 'minitest/autorun'

describe 'Test hashing requirements' do
  before do
    @cc1 = CreditCard.new('4916603231464963', 'Mar-30-2020', 'Soumya Ray', 'Visa')
    @cc2 = CreditCard.new('4916603231464963', 'Mar-30-2020', 'Soumya Ray', 'Visa')
    @cc3 = CreditCard.new('5423661657234057', 'Feb-30-2020', 'Soumya Ray', 'Mastercard')

  end

  describe 'Test regular hashing' do
    it 'should find the same hash for identical cards' do
      @cc1.hash.must_equal @cc2.hash
    end

    it 'should produce different hashes for different information' do
      @cc1.hash.wont_equal @cc3.hash
    end
  end

  describe 'Test cryptographic hashing' do
    it 'should find the same hash for identical cards' do
      @cc1.hash_secure.must_equal @cc2.hash_secure
    end

    it 'should produce different hashes for different information' do
      @cc1.hash_secure.wont_equal @cc3.hash_secure
    end

    it 'should not produce the same regular vs. cryptographic hash' do
      @cc1.hash_secure.wont_equal @cc1.hash
    end
  end
end
