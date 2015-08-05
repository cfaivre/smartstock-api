require_relative '../spec_helper'

describe "cnc" do

  before :each do
    Helpers::Cleanup.all
    Helpers::Setup.all
  end

  it "lists al cncs" do
    get '/api/cncs', {}, json_header

    expect(last_response.status).to eq 200
    expect(JSON.parse(last_response.body).count).to eq 25
  end

end
