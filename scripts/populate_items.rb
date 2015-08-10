#!/usr/bin/env ruby
require_relative '../app.rb'

# USAGE
# RACK_ENV='development' ./scripts/populate_items.rb

unless ['development', 'test'].include? ENV['RACK_ENV']
  puts "Can only run in development or test environment"
  exit
end
Item.delete_all
Item.create!( location: 'supplier', date: Date.parse('2015-01-01'), serial_number: '45gergreg55576',
              rfid: '2015052900000000000000000000ABE2', purchase_order_number: 'PO111111',
              sap_number: 'xxxxxxxxxxx', status: 'initialized' )
Item.create!( location: 'supplier', date: Date.parse('2015-01-01'), serial_number: '45gergreg55577',
              rfid: '2015052900000000000000000000ABD1', purchase_order_number: 'PO111111',
              sap_number: 'xxxxxxxxxxx', status: 'initialized' )
Item.create!( location: 'supplier', date: Date.parse('2015-01-01'), serial_number: '45gergreg55578',
              rfid: '20150529000000008FF92F2500000000', purchase_order_number: 'PO111111',
              sap_number: 'xxxxxxxxxxx', status: 'initialized' )
Item.create!( location: 'supplier', date: Date.parse('2015-01-01'), serial_number: '45gergreg55579',
              rfid: '2015052900000000000000000000ABCF', purchase_order_number: 'PO111111',
              sap_number: 'xxxxxxxxxxx', status: 'initialized' )
Item.create!( location: 'supplier', date: Date.parse('2015-01-01'), serial_number: '45gergreg55580',
              rfid: '2015052900000000000000000000ABD0', purchase_order_number: 'PO111111',
              sap_number: 'xxxxxxxxxxx', status: 'initialized' )
Item.create!( location: 'supplier', date: Date.parse('2015-01-01'), serial_number: '45gergreg55581',
              rfid: '2015052900000000000000000000ABD4', purchase_order_number: 'PO111111',
              sap_number: 'xxxxxxxxxxx', status: 'initialized' )
Item.create!( location: 'supplier', date: Date.parse('2015-01-01'), serial_number: '45555555555582',
              rfid: '2015052900000000000000000000ABD2', purchase_order_number: 'PO111111',
              sap_number: 'xxxxxxxxxxx', status: 'initialized' )
Item.create!( location: 'supplier', date: Date.parse('2015-01-01'), serial_number: '45gergreg55583',
              rfid: '2015052900000000000000000000ABD5', purchase_order_number: 'PO111111',
              sap_number: 'xxxxxxxxxxx', status: 'initialized' )
Item.create!( location: 'supplier', date: Date.parse('2015-01-01'), serial_number: 'diosao87dsa784',
              rfid: '2015052900000000000000000000ABD3', purchase_order_number: 'PO890879',
              sap_number: '32r3454tgre4', status: 'initialized' )
Item.create!( location: 'supplier', date: Date.parse('2015-01-01'), serial_number: 'diosao84gfvv85',
              rfid: '2015052900000000000000000000ABD6', purchase_order_number: 'PO890879',
              sap_number: '32r3454tgre4', status: 'initialized' )
