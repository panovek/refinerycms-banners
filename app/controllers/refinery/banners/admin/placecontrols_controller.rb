module Refinery
  module Banners
    module Admin
      class PlacecontrolsController < ::Refinery::AdminController

        crudify :'refinery/banners/placecontrol',
                :order => 'created_at desc'

        def update
          placecontrol = Placecontrol.find(params[:id])
          placecontrol.update(placecontrol_params)
          redirect_to banners_admin_placecontrols_path
        end

        protected

        def placecontrol_params
          params.require(:placecontrol).permit(:show_on_leftside, :show_on_rightside, :show_on_center)
        end

      end
    end
  end
end
