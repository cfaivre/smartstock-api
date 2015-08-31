require_relative '../spec_helper'

describe "stock take" do

  before :each do
    Helpers::Cleanup.all
    Helpers::Setup.all
  end

  it "lists all stock takes" do
    Helpers::Setup.stock_takes
    get '/api/stock-takes', {}, json_header

    expect(last_response.status).to eq 200
    response = JSON.parse(last_response.body)
    expect( response.count ).to eq 2
    expect( response.first['items'] ).to eq [ "2015052900000000000000000000ABE2", "2015052900000000000000000000ABD1",
                                              "20150529000000008FF92F2500000000", "2015052900000000000000000000ABD6",
                                              "2015052900000000000000000000ABD3", "2015052900000000000000000000ABD5" ]
  end

  it "creates a new stock take" do
    rfids = [ '2015052900000000000000000000ABD3', '2015052900000000000000000000ABD5', '2015052900000000000000000000ABCF' ]
    put '/api/stock_take', { rfids: rfids }.to_json, json_header
    expect(last_response.status).to eq 200
    response = JSON.parse(last_response.body)
    expect( StockTake.all.count ).to eq 1
    expect( StockTake.first.items ).to match_array( rfids )
  end
end
