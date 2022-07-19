require_relative 'temperature_displayable'

class WheatherPredicter
  include TemperatureDisplayable

  COUNT_COUNTER = 10

  attr_reader :lat, :lon, :mode, :temperature_type, :month, :extended_output, :options

  def initialize(lat:, lon:, day:, month:, **kwargs)
    @lat = lat
    @lon = lon
    @day = day
    @month = month.to_sym
    @options = kwargs

    @mode = options[:mode] || 'd'
    @temperature_type = options[:temperature_type] || 'c'
    @extended_output = options[:extended_output] || false
  end

  def call
    temperature = predict
    temperature = translate_to_forenheit(temperature)

    return render_result(initiator: 'Open Wheather Api', data: temperature.round(2), temperature_type: temperature_type) if extended_output

    temperature.round(2)
  end

  private

  def translate_to_forenheit(temperature)
    case temperature_type
    when 'c'
      temperature
    when 'f'
      (temperature.to_f * (9.0/5.0)) + 32
    else
      raise NoImplemented
    end
  end

  def predict
    case mode
    when 'd'
      calculate_average_value
    else
      raise NoImplemented
    end
  end

  def calculate_average_value
    collect = []
    count = predicted_celcium_mock_data.length
    
    COUNT_COUNTER.times do 
      collect << predicted_celcium_mock_data[month]
    end

    collect.sum.to_f / count.to_f
  end

  def predicted_celcium_mock_data
    {
      Jan: rand(-20..0),
      Feb: rand(-18..0),
      Mar: rand(-15..2),
      Apr: rand(-10..6),
      May: rand(-3..18),
      Jun: rand(8..24),
      Jul: rand(18..40),
      Aug: rand(16..37),
      Sep: rand(10..20),
      Oct: rand(4..15),
      Nov: rand(-4..8),
      Dec: rand(-10..2),
    }
  end
end