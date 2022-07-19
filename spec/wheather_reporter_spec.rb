require_relative '../wheather_reporter'
require_relative '../open_wheather_api'

describe WheatherReporter do
  it "should return temperature of specific lat and lon without extend option" do
    open_wheather_api = OpenStruct.new(get_wheather_data: '20.2')
    allow(OpenWheatherApi).to receive(:new).with(lat: 10.2, lon: 23.1).and_return(open_wheather_api)

    fetcher = WheatherReporter.new(lat: 10.2, lon: 23.1)
    res = fetcher.get_wheather_data

    expect(res).to include("20.2")
  end
end