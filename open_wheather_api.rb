require 'json'
require_relative 'temperature_displayable'
require 'dotenv'
Dotenv.load('./.env')

class OpenWheatherApi
  include TemperatureDisplayable

  API = ENV["OPEN_WHEATHER_API"]

  attr_reader :lat, :lon, :temperature_type, :lang, :extended_output, :options

  def initialize(lat:, lon:, **kwargs)
    @lat = lat
    @lon = lon
    @options = kwargs

    @temperature_type = options[:temperature_type] || 's'
    @lang = options[:lang] || 'ru'
    @extended_output = options[:extended_output] || false
  end

  def temperature_metric
    case temperature_type
    when 'c'
      'metrics'
    when 'f'
      'imperial'
    when 's'
      'standard'
    else
      raise NoImplemented
    end
  end

  def get_wheather_data
    uri = URI(api_url)
    res = Net::HTTP.get_response(uri)

    parse_result(res.body)
  end

  def parse_result(response)
    temperature = JSON.parse(response)['main']['temp']

    return render_result(data: temperature.round(2), temperature_type: temperature_type, initiator: 'Open Wheather Api') if extended_output

    temperature.round(2)
  end

  def api_url
    "https://api.openweathermap.org/data/2.5/weather?lat=#{ lat }&lon=#{ lon }&appid=#{API}&lang=#{lang}&units=#{temperature_metric}"
  end
end