module Refinery
  module Banners
    class Placecontrol < Refinery::Core::BaseModel
      self.table_name = 'refinery_banners_placecontrols'

      belongs_to :page
    end
  end
end
