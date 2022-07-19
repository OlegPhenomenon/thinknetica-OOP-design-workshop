require 'uri'
require 'net/http'

class WheatherReporter  
  attr_reader :lat, :lon, :options

  def initialize(lat:, lon:, **kwargs)
    @lat = lat
    @lon = lon
    @options = kwargs

    @observers = []
    self.attach(OpenWheatherApi.new(lat: lat, lon: lon, **options))
  end

  def get_wheather_data
    @observers.map do |observer| 
      observer.get_wheather_data
    end
  end

  private

  def attach(observer)
    @observers << observer
  end

  def detach(observer)
    @observers.delete(observer)
  end
end
