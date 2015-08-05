module Helpers
  module Cleanup
    def self.all
      cncs
      warehouses
      locations
      item_types
      items
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

    def self.warehouses
      Warehouse.delete_all
    end

  end
end
