require 'sinatra'
require './lib/credit_card.rb'

class CreditCardAPI < Sinatra::Base
  get '/' do
    'CreditCardAPI is up and running: API available at /api/v1/'
  end

  get '/api/v1/credit_card/validate' do
    number = params[:card_number]
    halt 400 unless number
    card = CreditCard.new(number,nil,nil,nil)
    {
      card: number,
      validated: card.validate_checksum
    }.to_json

  end

end
