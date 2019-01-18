require 'httparty'
require 'json'

class JCDecaux
  include HTTParty
  base_uri 'https://api.jcdecaux.com/vls/v1'

  def self.api_key_parameter
    "apiKey=#{ENV['JCDECAUX_API_KEY']}"
  end

  def self.contracts
    get("/contracts?#{api_key_parameter}")
  end

  def self.stations(in_contract:)
    get("/stations?contract=#{in_contract}&#{api_key_parameter}")
  end

  def self.station_information(number: '', contract: '')
    get("/stations/#{number}?contract=#{contract}&#{api_key_parameter}")
  end
end