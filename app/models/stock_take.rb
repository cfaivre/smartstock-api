class StockTakeError < StandardError; end
class StockTake
  include Mongoid::Document
  include Mongoid::Timestamps

  field :items, type: Array

end
