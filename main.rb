require_relative 'wheather_reporter'
require_relative 'open_wheather_api'
require_relative 'wheather_predicter'
require_relative 'factory'

fetcher = WheatherReporter.new(lat: 59.43, lon: 24.75, extended_output: true, temperature_type: 's', lang: 'ru')
res = fetcher.get_wheather_data
puts res


months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov']
predicter = WheatherPredicter.new(lat: 59.43,
                                  lon: 24.75,
                                  extended_output: true,
                                  day: 21,
                                  month: months.sample)
puts predicter.call


ice_fabric = Factory.assign_fabric(factory_type: 'ice_cream',
                                   quantity: 10,
                                   ice_cream_class: 'cup',
                                   package_type: 'foil',
                                   is_predict: true)
puts ice_fabric.product!

