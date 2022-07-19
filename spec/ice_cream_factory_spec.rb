require_relative '../ice_cream_factory/factory'

describe IceCreamFactory::Factory do
  describe "temperature metrics" do
    it "temperature lower then 10" do
      allow_any_instance_of(WheatherPredicter).to receive(:calculate_average_value).and_return(8)

      months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov']
      predicter = WheatherPredicter.new(lat: 59.43,
                                        lon: 24.75,
                                        extended_output: true,
                                        day: 21,
                                        month: months.sample)

      ice_factory = IceCreamFactory::Factory.new(quantity: 20,
                                                ice_cream_class: 'stick',
                                                package_type: 'foil',
                                                is_predict: true)
      result = ice_factory.product!
      expect(result).to include('10 Foil Package ice creams')
    end

    it "temperature between 10 and 30" do
      allow_any_instance_of(WheatherPredicter).to receive(:calculate_average_value).and_return(20)

      months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov']
      predicter = WheatherPredicter.new(lat: 59.43,
                                        lon: 24.75,
                                        extended_output: true,
                                        day: 21,
                                        month: months.sample)

      ice_factory = IceCreamFactory::Factory.new(quantity: 20,
                                                ice_cream_class: 'stick',
                                                package_type: 'foil',
                                                is_predict: true)
      result = ice_factory.product!
      expect(result).to include('20 Foil Package ice creams')
    end

    it "temperature more than 30" do
      allow_any_instance_of(WheatherPredicter).to receive(:calculate_average_value).and_return(32)

      months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov']
      predicter = WheatherPredicter.new(lat: 59.43,
                                        lon: 24.75,
                                        extended_output: true,
                                        day: 21,
                                        month: months.sample)

      ice_factory = IceCreamFactory::Factory.new(quantity: 20,
                                                ice_cream_class: 'stick',
                                                package_type: 'foil',
                                                is_predict: true)
      result = ice_factory.product!
      expect(result).to include('30 Foil Package ice creams')
    end
  end

  describe "predicted is turning off" do
    it "temperature more than 30" do
      allow_any_instance_of(WheatherPredicter).to receive(:calculate_average_value).and_return(32)

      months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov']
      predicter = WheatherPredicter.new(lat: 59.43,
                                        lon: 24.75,
                                        extended_output: true,
                                        day: 21,
                                        month: months.sample)

      ice_factory = IceCreamFactory::Factory.new(quantity: 20,
                                                ice_cream_class: 'stick',
                                                package_type: 'foil',
                                                is_predict: false)
      result = ice_factory.product!
      expect(result).to include('20 Foil Package ice creams')
    end
  end
end
