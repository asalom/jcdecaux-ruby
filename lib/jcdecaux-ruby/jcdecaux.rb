require 'httparty'
require 'json'

class JCDecaux
  include HTTParty
  base_uri 'https://api.jcdecaux.com/vls/v1'

  def api_key_parameter
    "apiKey=#{ENV['JCDECAUX_API_KEY']}"
  end

  def contracts
    self.class.get("/contracts?#{api_key_parameter}")
  end

  def stations(in_contract:)
    self.class.get("/stations?contract=#{in_contract}&#{api_key_parameter}")
  end

  def station_information(number: '', contract: '')
    self.class.get("/stations/#{number}?contract=#{contract}&#{api_key_parameter}")
  end
end