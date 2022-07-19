require_relative '../wheather_predicter'

describe WheatherPredicter do
  it "should return predicted temperature in celcium" do
    allow_any_instance_of(WheatherPredicter).to receive(:calculate_average_value).and_return(20)

    months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov']
    predicter = WheatherPredicter.new(lat: 59.43,
                                      lon: 24.75,
                                      extended_output: true,
                                      day: 21,
                                      month: months.sample)
    expect(predicter.call).to eq("20 in C -Open Wheather Api")
  end
end
