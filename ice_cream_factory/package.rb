require_relative 'foil_package'

class Package
  def self.produce_package(ice_cream_class:, package_type:)
    case package_type
    when 'foil'
      FoilPackage.new.name
    else
      raise NoImplemented
    end
  end
end