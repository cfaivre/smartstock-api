class ItemError < StandardError; end
class Item
  include Mongoid::Document
  include Mongoid::Timestamps

  field :location,              type: String
  field :date,                  type: Date
  field :serial_number,         type: String
  field :storage_location,      type: String
  field :rfid,                  type: String
  field :purchase_order_number, type: String
  field :sap_number,            type: String

  validates_uniqueness_of :rfid
  validates_uniqueness_of :serial_number

end
