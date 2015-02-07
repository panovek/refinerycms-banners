module Refinery
  module Banners
    class BannersController < ::ApplicationController

      before_action :find_all_banners
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @banner in the line below:
        present(@page)
      end

      def show
        @banner = Banner.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @banner in the line below:
        present(@page)
      end

    protected

      def find_all_banners
        @banners = Banner.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/banners").first
      end

    end
  end
end
