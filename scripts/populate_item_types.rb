#!/usr/bin/env ruby
require_relative '../app.rb'

# USAGE
# RACK_ENV='development' ./scripts/populate_item_types.rb

unless ['development', 'test'].include? ENV['RACK_ENV']
  puts "Can only run in development or test environment"
  exit
end

ItemType.delete_all
ItemType.create!( sap_number: '0164584', description: 'POLE,WOOD 18.0X180-199 TOP DIA     D0048', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0164585', description: 'POLE,WOOD 18.0X200-219 TOP DIA     D0048', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0164582', description: 'POLE,WOOD 16.0X180-199 TOP DIA     D0049', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0164583', description: 'POLE,WOOD 16.0X200-219 TOP DIA     D0049', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0164527', description: 'POLE,WOOD  7.0X120-139 TOP DIA     D0050', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0164528', description: 'POLE,WOOD  7.0X100-120 TOP DIA     D0050', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0164564', description: 'POLE:WOOD;140-159MM TOP DIA X LG 11M', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0164566', description: 'POLE:WOOD;160-179MM TOP DIA X LG 11M', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0164567', description: 'POLE:WOOD;180-199MM TOP DIA X LG 11M', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0164568', description: 'POLE:WOOD;200-219MM TOP DIA X LG 11M', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0255411', description: 'POLE:180-199MMTOPDIA X LG11M 6500 C/ETH', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0559836', description: 'POLE:200-219MMTOPDIA X LG11M 6500 C/ETH', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0164562', description: 'POLE,WOOD 10.0m x 160-179 H4 D0052', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0164563', description: 'POLE,WOOD 10.0m x 180-199 H4 D0052', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0164523', description: 'POLE,WOOD 10.0m x 200-219 H4 D0052', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0164570', description: 'POLE:WOOD;160-179MM TOP DIA LG 12 M', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0164572', description: 'POLE:WOOD;180-199MM TOP DIA X LG 12 M', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0164573', description: 'POLE:WOOD;200-219MM TOP DIA X LG 12 M', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0255412', description: 'POLE:180-199MMTOPDIA X LG12M 5500 C/ETH', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0559837', description: 'POLE:200-219MMTOPDIA X LG12M 5500 C/ETH', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0164578', description: 'POLE,WOOD 14.0 X 160-179 H4 D0054', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0164579', description: 'POLE,WOOD 14.0 X 180-199 H4 D0054', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0164580', description: 'POLE,WOOD 14.0 X 200-219 H4 D0054', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0164560', description: 'POLE:WOOD;140-159MM TOP DIA X LG 9 M', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0164561', description: 'POLE:WOOD;160-179MM TOP DIA X LG 9 M', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0164589', description: 'POLE:WOOD;180-199MM TOP DIA X LG 9 M', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0255414', description: 'POLE:160-179MMTOPDIA X LG9M 7350 C/ETH', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0255415', description: 'POLE:180-199MMTOPDIA X LG9M 6500 C/ETH', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0255416', description: 'POLE:180-199MMTOPDIA X LG9M 5500 C/ETH', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0164575', description: 'POLE,WOOD 13.0 x 160-179 H4 D0056', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0164577', description: 'POLE,WOOD 13.0 x 180-199 H4 D0056', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0194043', description: 'POLE,WOOD 13.0 x 200-219 H4 D0056', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0164524', description: 'POLE,WOOD 15.0 x 200-219 TOP DIA     D0057', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0164531', description: 'POLE,WOOD  5.0 X 80-100 TOP DIA     D0058', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0164586', description: 'XARM,WOOD 2.0x120-139 TOP DIA      D0060', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0164591', description: 'XARM,WOOD 2.0x140-159 TOP DIA      D0060', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0164545', description: 'X/ARM,POLE:120-139 MM;LG 2.5 M;WOOD', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0164546', description: 'X/ARM,POLE:140-159 MM;LG 2.5 M;WOOD', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0164547', description: 'X/ARM,POLE:160-179 MM;LG 2.5 M;WOOD', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0571208', description: 'X/ARM,POLE:120-139 22MM HOLES;LG 2.5 M', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0571209', description: 'X/ARM,POLE:140-159 22MM HOLES;LG 2.5 M', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0571210', description: 'X/ARM,POLE:160-179 22MM HOLES;LG 2.5 M', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0164549', description: 'XARM,WOOD 3.0x140-159 TOP DIA      D0062', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0164550', description: 'XARM,WOOD 3,0x160-179 TOP DIA      D0062', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0164551', description: 'XARM,WOOD 3.5x140-159 TOP DIA      D0063', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0164552', description: 'XARM,WOOD 3.5x160-179 TOP DIA      D0063', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0164556', description: 'XARM,WOOD 4.5x160-179 TOP DIA      D0064', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0164559', description: 'XARM,POLE/XARM WD 8.0x160-179 T/DIA D0065', image: './img/stock/poles.jpg');
ItemType.create!( sap_number: '0183978', description: 'XARM,WOOD 6.0x160-179 TOP DIA      D0066', image: './img/stock/poles.jpg');
#ItemType.create!( sap_number: '', material_type: 'wood', description: 'Pole 3m length',
#                  image: './img/stock/poles.jpg', rating: '100kva')
#ItemType.create!( sap_number: '32r3454tgre4', material_type: 'pressed wood', description: 'Pole 11m length',
#                  image: './img/stock/poles2.jpg', rating: '200kva')
