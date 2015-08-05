class LocationError < StandardError; end
class Location
  include Mongoid::Document
  include Mongoid::Timestamps

  field :code, type: String
  field :name, type: String
  field :color, type: String
  field :highlight, type: String

  validates_uniqueness_of :color, :highlight

end
