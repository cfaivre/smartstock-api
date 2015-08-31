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
    stock_take = StockTake.create!( items: items, stats: stats )
    generate_pdf( stock_take.id.to_json, stock_take.created_at, stats )
    stock_take
  end

  def self.generate_pdf( id, date, data )
    require "prawn/table"
    pdf = Prawn::Document.new
    pdf.table([[{content: "Stock Level Report: #{date}", colspan: 8}]])
    pdf.table([ [ { content: 'SAP number', colspan: 2},
                  { content: 'Description', colspan: 2},
                  { content: 'Quantity', colspan: 2} ] ])
    data.each do |k, v|
      item_type = ItemType.where(sap_number: k).first
      pdf.table([ [ { content: k, colspan: 2},
                    { content: item_type.description.to_s, colspan: 2},
                    { content: v.to_s, colspan: 2} ] ])
    end
    pdf.render_file File.join(File.dirname(__FILE__), "/../pdfs/#{id}.pdf")
  end

end
