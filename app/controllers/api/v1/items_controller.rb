module Api
  module V1
    class ItemsController < ApiController
      respond_to :json

      def index
        respond_with Item.all
      end

      private
        def item_params
          params.permit(:name, :description, :image_url)
        end
    end
  end
end
