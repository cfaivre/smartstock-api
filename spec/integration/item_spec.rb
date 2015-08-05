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
    rfids = [ '1212213212133132434','1012213212133132434','11212213212133132434' ]
    get '/api/items/detail', ({ rfids: rfids })

    expect( last_response.status ).to eq 200
    expect( JSON.parse(last_response.body).count ).to eq 3
    expect( JSON.parse(last_response.body).map{|item| item['rfid']} ).to eq rfids
  end

  it "updates the new location and storage location for items" do
    rfids = [ '1212213212133132434','1012213212133132434','11212213212133132434' ]
    new_location = '0012'
    new_storage_location = 'bin 54'
    post '/api/items/locations', ({ rfids: rfids, new_location: new_location, new_storage_location: new_storage_location }).to_json, json_header
    expect( last_response.status ).to eq 200
    response_body = JSON.parse( last_response.body )
    expect( response_body['message'] ).to eq 'success'
    expect( Item.all.first.location ).to eq new_location
    expect( Item.all.first.storage_location ).to eq new_storage_location
    expect( Item.all.last.location ).to eq new_location
    expect( Item.all.last.storage_location ).to eq new_storage_location
  end
end
