module TemperatureDisplayable
  def render_result(data:, temperature_type:, initiator: nil)
    case temperature_type
    when 'c'
      render_in_celcium(data: data, initiator: initiator)
    when 'f'
      render_in_forengein(data: data, initiator: initiator)
    else
      'Wrong temperature type'
    end
  end

  def render_in_celcium(data:, initiator:)
    "#{data} in C -#{initiator}"
  end
  
  def render_in_forengein(data:)
    "#{data} in F - #{initiator}"
  end
end