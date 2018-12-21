require_relative 'jcdecaux-ruby/jcdecaux'
require 'pp'

api = JCDecaux.new
#pp = api.contracts
#pp api.stations(in_contract: :Valence)
pp api.station_information(number: 34, contract: :Valence)