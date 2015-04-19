require 'sinatra'
require './model/credit_card.rb'

class CreditCardAPI < Sinatra::Base
  get '/' do
    'CreditCardAPI is up and running: API available at /api/v1/'
  end

  get '/api/v1/credit_card/validate' do
    number = params[:card_number]
    halt 400 unless number
    card = CreditCard.new(number: number)
    {
      card: number,
      validated: card.validate_checksum
    }.to_json

  end

  post '/api/v1/credit_card' do
    number = nil
    expiration_date = nil
    owner = nil
    credit_network = nil
    request_json = request.body.read
    begin
      unless request_json.empty?
        req = JSON.parse(request_json)
        number = req['number']
        expiration_date = req['expiration_date']
        owner = req['owner']
        credit_network = req['credit_network']
      end

      card = CreditCard.new(number: number,
                           expiration_date: expiration_date,
                           owner: owner,
                           credit_network: credit_network)

       if card.validate_checksum
         if card.save
           return 201
         else
           halt 410
         end
       else
         halt 400, 'Number is invalid'
      end
    rescue
      halt 400, 'Oops, seems the parameters you sent where malformed'
    end
  end

  get '/api/v1/all_cc' do
    card = CreditCard.all
    if card.empty?
      halt 500, 'No data'
    else
      card = CreditCard.all
      card.to_json
      return 200
    end
  end
  
end
