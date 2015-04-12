require_relative 'credit_card.rb'
require 'benchmark'

def self.benchtest
  number = '4539075978941247'
  expiration_date = '12/03'
  owner = 'Edwin'
  credit_network = 'Citibank'
  n = 100_000
  card = CreditCard.new(number, expiration_date, owner, credit_network)
  Benchmark.bm(25) do |b|
    b.report('Test 1') {n.times {card.validate_checksum}}
    b.report('Test 2') {n.times {card.validate_checksum2}}
    #b.report('Test 3') {n.times {card.validate_checksum3}}

  end

end
