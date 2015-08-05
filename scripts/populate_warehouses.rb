#!/usr/bin/env ruby
require_relative '../app.rb'

# USAGE
# RACK_ENV='development' ./scripts/populate_warehouses.rb

unless ['development', 'test'].include? ENV['RACK_ENV']
  puts "Can only run in development or test environment"
  exit
end

Warehouse.delete_all
Warehouse.create!( name: 'brackenfell', code: '9999', color: '#000000', highlight: '#191919' ) #black
