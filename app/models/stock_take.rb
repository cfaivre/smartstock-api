class StockTakeError < StandardError; end
class StockTake
  include Mongoid::Document
  include Mongoid::Timestamps

  field :items, type: Array
  field :stats, type: Hash

  def self.upload( items )
    stats = {}
    items.map{|item|
      Item.where(rfid: item).map{ |x|
        if ( stats[x.sap_number].nil? )
          stats[x.sap_number] = 1
        else
          stats[x.sap_number] += 1
        end
      }
    }
    StockTake.create!(items: items, stats: stats)
  end

end
