module TemperatureDisplayable
  def render_result(data:, temperature_type:)
    case temperature_type
    when 'c'
      render_in_celcium(data: data)
    when 'f'
      render_in_forengein(data: data)
    else
      'Wrong temperature type'
    end
  end

  def render_in_celcium(data:)
    "#{data} in C"
  end
  
  def render_in_forengein(data:)
    "#{data} in F"
  end
end