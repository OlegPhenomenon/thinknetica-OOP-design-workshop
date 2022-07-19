require_relative 'ice_cream_stick'
require_relative 'ice_cream_cup'

class IceCreamClass
  def self.produce_ice_cream(ice_cream_class:)
    case ice_cream_class
    when 'stick'
      IceCreamStick.new.name
    when 'cup'
      IceCreamCup.new.name
    else
      raise NoImplemented
    end
  end
end