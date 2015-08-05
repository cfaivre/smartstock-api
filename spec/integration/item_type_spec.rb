require_relative '../spec_helper'

describe "item_type" do

  before :each do
    Helpers::Cleanup.all
    Helpers::Setup.all
  end

  it "lists al item_types" do
    get '/api/item-types', {}, json_header

    expect(last_response.status).to eq 200
    expect(JSON.parse(last_response.body).count).to eq 2
  end

end
