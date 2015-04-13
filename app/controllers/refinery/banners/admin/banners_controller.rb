module Refinery
  module Banners
    module Admin
      class BannersController < ::Refinery::AdminController

        crudify :'refinery/banners/banner'

        # override because acts_as_indexed dont work with utf8
        def index
          if params[:search].present?
            @banners = Banner.where('LOWER(title) ILIKE ?', "%#{params[:search].downcase}%")
          else
            @banners = Banner.all
          end
          @banners = @banners.order('created_at desc').paginate(:page => params[:page])
        end

        protected

        def banner_params
          params.require(:banner).permit(:title, :link, :description, :image_id, :is_active, :position, :start_date, :expiry_date, :banner_type)
        end
      end
    end
  end
end
