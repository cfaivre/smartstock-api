module Helpers
  module Cleanup
    def self.all
      cncs
      warehouses
      locations
      item_types
      items
      stock_takes
    end

    def self.cncs
      Cnc.delete_all
    end

    def self.items
      Item.delete_all
    end

    def self.item_types
      ItemType.delete_all
    end

    def self.locations
      Location.delete_all
    end

    def self.stock_takes
      StockTake.delete_all
      pdf_files = File.join(File.dirname(__FILE__), "../../app/pdfs/*.pdf")
      `rm -rf #{pdf_files}`
    end

    def self.warehouses
      Warehouse.delete_all
    end

  end
end
