module Api
  module V1
    class ActivitiesController < ApplicationController
      before_action :authorize_access_request!
      before_action :set_activity
      before_action :set_journey, only: [:show, :update, :destroy]
      before_action :verify_resource_is_authorised

      def index
        json_response(@activity.journeys)
      end

      def show
        json_response(@journey)
      end

      def create
        @journey = Journey.new(journey_params)
        if @journey.save!
          render json: { message: 'journey correctly created', journey: @journey }, status: :ok
        else
          render json: { error: @journey.errors.full_messages.join(' ') }, status: :unprocessable_entity
        end
      end

      def update
        @journey.update(journey_params)
        render json: { message: 'Record successfully updated', journey: @journey },status: :ok
      end

      def destroy
        @journey.destroy!
        render json: { message: 'Record successfully deleted' }, status: :ok
      end


      private

      def set_activity
        @activity ||= Activity.find(params[:activity_id])
      end

      def set_journey
        @journey ||= Activity.find(journey_params.require(:id))
      end

      def journey_params
        params.permit(:id, :activity_id, :pickup_time, :pick_up_address, :destination_address, :driver_id, :details)
      end
    end
  end
end
