module Api
  module V1
    class ActivitiesController < ApplicationController
      before_action :authorize_access_request!
      before_action :set_kid, :set_parent
      before_action :set_activity, only: [:show, :update, :destroy]
      before_action :verify_resource_is_authorised

      def index
        json_response(@kid.activities)
      end

      def show
        json_response(@activity)
      end

      def create
        @activity = Activity.new(activity_params)
        if @activity.save!
          render json: { message: 'activity correctly created', activity: @activity }, status: :ok
        else
          render json: { error: @activity.errors.full_messages.join(' '), message: 'To create an activity, provide an :activity_name, :description and a :kid_id' }, status: :unprocessable_entity
        end
      end

      def update
        @activity.update(activity_params)
        render json: { message: 'Record successfully updated', activity: @activity },status: :ok
      end

      def destroy
        @activity.destroy!
        render json: { message: 'Record successfully deleted' }, status: :ok
      end


      private

      def set_parent
        @parent ||= Parent.find(params[:parent_id])
      end

      def set_kid
        @kid ||= Kid.find(activity_params.require(:kid_id))
      end

      def set_activity
        @activity ||= Activity.find(activity_params.require(:id))
      end

      def activity_params
        params.permit(:activity_name, :description, :kid_id, :id, :details)
      end
    end
  end
end
