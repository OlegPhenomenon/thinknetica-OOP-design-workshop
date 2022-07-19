require_relative 'package'
require_relative 'ice_cream_class'

module IceCreamFactory
class Factory
  attr_reader :ice_cream_class, :quantity, :package_type, :is_predict

  def initialize(ice_cream_class:, quantity:, package_type:, is_predict: true)
    @ice_cream_class = ice_cream_class
    @quantity = quantity
    @package_type = package_type
    @is_predict = is_predict
  end

  def product!
    month = random_month
    counter = (quantity * define_multiplier(month: month)).round if is_predict

    ice_cream_package = nil
    sort_of_ice_cream = nil

    counter.times do |i|
      sort_of_ice_cream = IceCreamClass.produce_ice_cream(ice_cream_class: ice_cream_class)
      ice_cream_package = Package.produce_package(package_type: package_type, ice_cream_class: ice_cream_class)
    end

    puts display(month: month,
                 quantity: counter,
                 ice_cream_package: ice_cream_package,
                 sort_of_ice_cream: sort_of_ice_cream)
  end

  private

  def random_month
    months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov']
    months.sample
  end

  def display(month:, quantity:, ice_cream_package:, sort_of_ice_cream:)
    "Today: 21 of #{month} -> #{quantity} #{ice_cream_package} ice creams \"#{sort_of_ice_cream}\" were produced. Predicted is #{is_predict}"
  end

  def define_multiplier(month:)
    predicter = WheatherPredicter.new(lat: 33.44, lon: 94.04, day: 21, month: month)
    temp = predicter.call

    if temp > 30
      multiplier = 1.5
    elsif temp < 10
        multiplier = 0.5
    else
      multiplier = 1
    end

    multiplier
  end
end
end
