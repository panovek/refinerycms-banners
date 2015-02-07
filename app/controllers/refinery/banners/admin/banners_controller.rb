module Refinery
  module Banners
    module Admin
      class BannersController < ::Refinery::AdminController

        crudify :'refinery/banners/banner'

        protected

        def banner_params
          params.require(:banner).permit(:title, :link, :description, :image_id, :is_active, :position, :start_date, :expiry_date)
        end
      end
    end
  end
end
