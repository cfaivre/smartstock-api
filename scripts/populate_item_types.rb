#!/usr/bin/env ruby
require_relative '../app.rb'

# USAGE
# RACK_ENV='development' ./scripts/populate_item_types.rb

unless ['development', 'test'].include? ENV['RACK_ENV']
  puts "Can only run in development or test environment"
  exit
end

ItemType.delete_all
ItemType.create!( sap_number: 'xxxxxxxxxxx', material_type: 'wood', description: 'Pole 3m length',
                  image: './img/stock/poles.jpg', rating: '100kva')
ItemType.create!( sap_number: '32r3454tgre4', material_type: 'pressed wood', description: 'Pole 11m length',
                  image: './img/stock/poles2.jpg', rating: '200kva')
