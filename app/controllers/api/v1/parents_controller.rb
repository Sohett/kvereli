module Api
  module V1
    class ParentsController < ApplicationController
      before_action :set_parent, only: [:show, :update, :destroy]

      def index
        @parents = Parent.all
        json_response(@parents)
      end

      def show
        json_response(@parent)
      end

      def create
        @parent = Parent.create!(parent_params)
        json_response(@parent, :created)
      end

      def update
        @parent.update(parent_params)
        head :no_content
      end

      def destroy
        @parent.destroy
        head :no_content
      end


      private

      def parent_params
        params.permit(:email, :encrypted_password, :user_id)
      end

      def set_parent
        @parent = Parent.find(params[:id])
      end
    end
  end
end
