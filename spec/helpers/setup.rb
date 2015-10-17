module Helpers
  module Setup
    def self.all
      item_types
      items
      locations
    end

    def self.locations
      Location.create!( name: 'in-transit', code: '', color: '#0066CC', highlight: '#99C2EB' )
      Location.create!( name: 'supplier', code: '', color: '#336600', highlight: '#C2D1B2' )
    end

    def self.items
      Item.create!( rfid: '2015052900000000000000000000ABE2', sap_number: '0164584' )
      Item.create!( rfid: '2015052900000000000000000000ABD1', sap_number: '0164584' )
      Item.create!( rfid: '20150529000000008FF92F2500000000', sap_number: '0164584' )
      Item.create!( rfid: '2015052900000000000000000000ABCF', sap_number: '0164584' )
      Item.create!( rfid: '2015052900000000000000000000ABD0', sap_number: '0164584' )
      Item.create!( rfid: '2015052900000000000000000000ABD4', sap_number: '0164584' )
      Item.create!( rfid: '2015052900000000000000000000ABD2', sap_number: '0164585' )
      Item.create!( rfid: '2015052900000000000000000000ABD5', sap_number: '0164585' )
      Item.create!( rfid: '2015052900000000000000000000ABD3', sap_number: '0164585' )
      Item.create!( rfid: '2015052900000000000000000000ABD6', sap_number: '0164585' )
    end

    def self.item_types
      ItemType.create!( sap_number: '0164584', material_type: 'wooden pole', description: 'POLE,WOOD 18.0X180-199 TOP DIA     D0048', image: './img/pole_white.jpg', color: 'white');
      ItemType.create!( sap_number: '0164585', material_type: 'wooden pole', description: 'POLE,WOOD 18.0X200-219 TOP DIA     D0048', image: './img/pole_purple.jpg', color: 'purple');
    end

    def self.stock_takes
      StockTake.create!( items: [ '2015052900000000000000000000ABE2','2015052900000000000000000000ABD1','20150529000000008FF92F2500000000',
                                  '2015052900000000000000000000ABD6','2015052900000000000000000000ABD3','2015052900000000000000000000ABD5' ] )
      StockTake.create!( items: [ '2015052900000000000000000000ABCF','2015052900000000000000000000ABD0','2015052900000000000000000000ABD4',
                                  '2015052900000000000000000000ABD2' ] )
    end

  end
end
