class CncError < StandardError; end
class Cnc
  include Mongoid::Document
  include Mongoid::Timestamps

  field :code, type: String
  field :name, type: String
  field :color, type: String
  field :highlight, type: String

#Codes are currently not unique. Worcester and Polkadraai share the same code
#  validates_uniqueness_of :code
  validates_uniqueness_of :color, :highlight

end
