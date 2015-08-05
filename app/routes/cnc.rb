require 'cgi'
require 'json'

class StockApiApp < Sinatra::Base

  get '/api/cncs' do
    content_type :json
    result = nil
    begin
      result = Cnc.all
      halt 200, result.to_json
    rescue CncError => e
      halt 500, { errors: { message: e.message.to_s } }.to_json
    end
    return result.to_json
  end
end
