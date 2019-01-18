require_relative '../jcdecaux'
require_relative 'hash'
require_relative 'station_information'
require 'ostruct'

# {
#   "number": 122,
#   "contract_name": "Brisbane",
#   "name": "122 - LOWER RIVER TCE / ELLIS ST",
#   "address": "Lower River Tce / Ellis St",
#   "position": {
#     "lat": -27.482279,
#     "lng": 153.028723
#   },
#   "banking": true,
#   "bonus": false,
#   "bike_stands": 16,
#   "available_bike_stands": 5,
#   "available_bikes": 9,
#   "status": "OPEN",
#   "last_update": 1547803069000
# }

class Station < OpenStruct
  def information
    JCDecaux.station_information(number: number, contract: contract_name).convert_to_type(StationInformation)
  end

  def self.all(in_contract:)
    JCDecaux.stations(in_contract: in_contract).map { |station| station.convert_to_type(Station) }
  end
end