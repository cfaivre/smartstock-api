require 'cgi'
require 'json'
require 'uri'

class StockApiApp < Sinatra::Base

  get '/api/items' do
    content_type :json
    result = nil
    begin
      result = Item.where(params).map{|item| item.as_document}
      halt 200, result.to_json
    rescue ItemError => e
      halt 500, { errors: { message: e.message.to_s } }.to_json
    end
    return result.to_json
  end

  get '/api/items/detail' do
    content_type :json
    params.merge!(CGI.parse(request.query_string).symbolize_keys)
    items = []
    rfids = params[:rfids]
    Item.where(:rfid.in => rfids).each do |item|
      items << item
    end
    items.to_json
  end

  post '/api/items/locations' do
    params = JSON.parse(request.body.read, :symbolize_names => true)
    begin
      params[:rfids].each { |rfid|
        Item.where( rfid: rfid ).set( location: params[:new_location] )
        Item.where( rfid: rfid ).set( storage_location: params[:new_storage_location] )
      }
      { message: 'success' }.to_json
    rescue ItemError => e
       status 422 and { message: e.message }.to_json
    end
  end

  post '/api/items/scanned' do
    params = request.body.read
    uri_params = URI.decode(params)
    params = CGI::parse(uri_params)
    reader_name = params['reader_name'][0].gsub(/\"/,'')
    rfids = params['field_values'][0].split( /\n/ ).map{ |x| x.gsub(/\"/,'') }.uniq
    begin
      rfids.each { |rfid|
        Item.where( rfid: rfid ).set( location: reader_name )
      }
      { message: 'success' }.to_json
    rescue ItemError => e
       status 422 and { message: e.message }.to_json
    end
  end
end
