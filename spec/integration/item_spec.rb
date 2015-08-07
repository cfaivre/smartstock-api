require_relative '../spec_helper'

describe "item" do

  before :each do
    Helpers::Cleanup.all
    Helpers::Setup.all
  end

  it "lists all items" do
    get '/api/items', {}, json_header

    expect(last_response.status).to eq 200
    expect(JSON.parse(last_response.body).count).to eq 3
  end

  it "lists all items for provided sap number" do
    get '/api/items', {sap_number: '11111111111111'}, json_header
    expect(last_response.status).to eq 200
    response = JSON.parse(last_response.body)
    expect(response[0]['sap_number']).to eq '11111111111111'
    expect(response[1]['sap_number']).to eq '11111111111111'
    expect(response.count).to eq 2
  end

  it "returns the details of each item in the provided list" do
    rfids = [ '2015052900000000000000000000ABD3', '2015052900000000000000000000ABD5',
              '2015052900000000000000000000ABCF' ]
    get '/api/items/detail', ({ rfids: rfids })

    expect( last_response.status ).to eq 200
    expect( JSON.parse(last_response.body).count ).to eq 3
    expect( JSON.parse(last_response.body).map{|item| item['rfid']} ).to eq rfids
  end

  it "updates the new location and storage location for items" do
    reader_name = 'brackenfell-gate1'
    post_body = "reader_name=%22brackenfell%2dgate1%22&mac_address=%2200%3a16%3a25%3a10%3aE3%3a04%22&line_ending=%0a&field_delim=%2c&field_names=epc&field_values=%2220150529000000008FF92F2500000000%22%0a%222015052900000000000000000000ABE2%22%0a%22340966364CB0000003A00C1B%22%0a%222015052900000000000000000000ABD0%22%0a%222015052900000000000000000000ABD4%22%0a%222015052900000000000000000000ABD1%22%0a%222015052900000000000000000000ABD3%22%0a%222015052900000000000000000000ABD5%22%0a%222015052900000000000000000000ABCF%22%0a%2220150529000000008FF92F2500000000%22%0a%222015052900000000000000000000ABD6%22%0a%22340966364CB0000003A00C1B%22%0a%222015052900000000000000000000ABE2%22%0a%222015052900000000000000000000ABD1%22%0a%222015052900000000000000000000ABD2%22%0a%222015052900000000000000000000ABE2%22%0a%222015052900000000000000000000ABCF%22%0a%222015052900000000000000000000ABD0%22%0a%222015052900000000000000000000ABD5%22%0a%222015052900000000000000000000ABD6%22%0a%22340966364CB0000003A00C1B%22%0a%222015052900000000000000000000ABD4%22%0a%222015052900000000000000000000ABD3%22%0a%2220150529000000008FF92F2500000000%22%0a%22340966364CB0000003A00C1B%22%0a%222015052900000000000000000000ABD1%22%0a%222015052900000000000000000000ABE2%22%0a%222015052900000000000000000000ABCF%22%0a%222015052900000000000000000000ABD6%22%0a%222015052900000000000000000000ABD0%22%0a%222015052900000000000000000000ABD2%22%0a%222015052900000000000000000000ABD5%22%0a%222015052900000000000000000000ABD3%22%0a%222015052900000000000000000000ABD4%22%0a%2220150529000000008FF92F2500000000%22%0a%2220150529000000008FF92F2500000000%22%0a%222015052900000000000000000000ABD5%22%0a%222015052900000000000000000000ABD2%22%0a%222015052900000000000000000000ABD6%22%0a%222015052900000000000000000000ABD4%22%0a%222015052900000000000000000000ABCF%22%0a%222015052900000000000000000000ABD1%22%0a%22340966364CB0000003A00C1B%22%0a%222015052900000000000000000000ABE2%22%0a%222015052900000000000000000000ABD0%22%0a%222015052900000000000000000000ABD3%22%0a%222015052900000000000000000000ABD0%22%0a%2220150529000000008FF92F2500000000%22%0a%22340966364CB0000003A00C1B%22%0a%222015052900000000000000000000ABCF%22%0a%222015052900000000000000000000ABD6%22%0a%222015052900000000000000000000ABD4%22%0a%222015052900000000000000000000ABD5%22%0a%222015052900000000000000000000ABD2%22%0a%222015052900000000000000000000ABD1%22%0a"
    post '/api/items/scanned', (post_body), plain_header
    expect( last_response.status ).to eq 200
    response_body = JSON.parse( last_response.body )
    expect( response_body['message'] ).to eq 'success'
    expect( Item.all.first.location ).to eq reader_name
    expect( Item.all.first.status ).to eq 'unaccepted'
  end
end
