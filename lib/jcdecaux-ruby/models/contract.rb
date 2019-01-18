require_relative '../jcdecaux'
require_relative 'station'
require_relative 'hash'
require 'ostruct'

# {
#   "name": "Rouen",
#   "commercial_name": "cy'clic",
#   "cities": [
#   "Rouen"
#   ],
#   "country_code": "FR"
# }

class Contract < OpenStruct
  def stations
    JCDecaux.stations(in_contract: name).map { |station| station.convert_to_type(Station) }
  end

  def self.all
    JCDecaux.contracts.map { |contract| contract.convert_to_type(Contract) }
  end
end