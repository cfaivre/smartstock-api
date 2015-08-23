require 'sinatra/base'
require 'mongoid'

require_relative './app/models/cnc'
require_relative './app/models/item'
require_relative './app/models/item_type'
require_relative './app/models/location'
require_relative './app/models/stock_take'
require_relative './app/models/warehouse'
Dir[File.join(File.dirname(__FILE__), "/app/routes/*.rb")].each {|file| require file }

class StockApiApp < Sinatra::Base

  Mongoid.load!('config/mongoid.yml')

  before do
    headers 'Access-Control-Allow-Headers' => 'Origin, X-Requested-With, Content-Type, Accept',
            'Access-Control-Allow-Methods' => 'GET, HEAD, OPTIONS, POST',
            'Access-Control-Allow-Origin' => '*'
  end

  options '/*.*' do
    ''
  end

end
