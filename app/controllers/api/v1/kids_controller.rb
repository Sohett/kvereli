module Api
  module V1
    class ParentsController < ApplicationController
      before_action :authorize_access_request!
      before_action :set_kid, only: [:show, :update]

      def index
        json_response(current_parent.kids)
      end

      def show
        json_response(@kid)
      end

      def create
        #code
      end

      def update
        @kid.update(kid_params)
        head :no_content
      end

      private

      def set_kid
        @kid = Kid.find(params[:id])
      end
    end
  end
end
