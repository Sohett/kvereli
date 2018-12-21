module Api
  module V1
    class KidsController < ApplicationController
      before_action :authorize_access_request!
      before_action :payload_verification, only: [:create, :update]
      before_action :set_parent
      before_action :set_kid, only: [:show, :update, :destroy]
      before_action :verify_resource_is_authorised

      def index
        json_response(current_parent.kids)
      end

      def show
        json_response(@kid)
      end

      def create
        @kid = Kid.new(kid_payload)
        if @kid.save!
          render json: { message: 'kid correctly created', kid: @kid }, status: :ok
        else
          render json: { error: @kid.errors.full_messages.join(' ') }, status: :unprocessable_entity
        end
      end

      def update
        @kid.update(kid_params)
        render json: { message: 'Record successfully updated', kid: @kid}, status: :ok
      end

      def destroy
        @kid.destroy!
        render json: { message: 'Record successfully deleted' }, status: :ok
      end


      private

      def set_parent
        @parent ||= Parent.find(kid_params.require(:parent_id))
      end

      def set_kid
        @kid ||= Kid.find(kid_params.require(:id))
      end

      def kid_params
        @kid_params ||= params.permit(:first_name, :last_name, :birthdate, :parent_id, :id)
      end

      def payload_verification
        render json: { message: 'Missing birthdate: in the format(dd/mm/yyyy)' }, status: :precondition_failed if !kid_params[:birthdate]
      end

      def kid_payload
        parent_payload = { parent_id: current_parent.id }
        @kid_params[:birthdate] = kid_birthdate
        @kid_params.merge(parent_payload)
      end

      def kid_birthdate
        @kid_params.require(:birthdate).to_date
      end
    end
  end
end
