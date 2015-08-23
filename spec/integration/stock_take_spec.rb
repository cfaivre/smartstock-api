require_relative '../spec_helper'

describe "stock take" do

  before :each do
    Helpers::Cleanup.all
    Helpers::Setup.all
  end

  it "lists all stock takes" do
    get '/api/stock_takes', {}, json_header

    expect(last_response.status).to eq 200
    response = JSON.parse(last_response.body)
    expect( response.count ).to eq 1
    expect( response[0]['items'] ).to eq [ '2015052900000000000000000000ABD3', '2015052900000000000000000000ABD5', '2015052900000000000000000000ABCF' ]
  end

end
