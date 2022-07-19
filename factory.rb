require_relative 'ice_cream_factory/factory'

class Factory
  def self.assign_fabric(factory_type:, **kwargs)
    case factory_type
    when 'ice_cream'
      IceCreamFactory::Factory.new(quantity: kwargs[:quantity],
                                   ice_cream_class: kwargs[:ice_cream_class],
                                   package_type: kwargs[:package_type],
                                   is_predict: kwargs[:is_predict])
    else 
      raise NoImplemented
    end
  end
end
