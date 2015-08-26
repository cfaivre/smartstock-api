#!/usr/bin/env ruby
require_relative '../app.rb'

# USAGE
# RACK_ENV='development' ./scripts/populate_locations.rb

#unless ['development', 'test'].include? ENV['RACK_ENV']
#  puts "Can only run in development or test environment"
#  exit
#end

Location.delete_all
Location.create!( name: 'in-transit', code: '', color: '#0066CC', highlight: '#99C2EB' ) #blue
Location.create!( name: 'supplier', code: '', color: '#336600', highlight: '#C2D1B2' ) #green
