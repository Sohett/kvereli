module Api
  module V1
    class ParentsController < ApplicationController
      before_action :authorize_refresh_by_access_request!, only: [:refresh]
      before_action :authorize_access_request!, only: [:show, :update, :logout]
      before_action :set_parent, only: [:show, :update]
      before_action :verify_resource_is_authorised, only: [:show, :update]

      def show
        json_response(@parent)
      end

      def update
        @parent.update(parent_params)
        head :no_content
      end

      def sign_in
        @parent = Parent.find_by!(email: email_params)
        if @parent.authenticate(password_params)
          set_jwt_session
          success_response
        else
          not_authorized
        end
      end

      def sign_up
        @parent = Parent.new(parent_params)
        if @parent.save
          set_jwt_session
          success_response
        else
          render json: { error: @parent.errors.full_messages.join(' ') }, status: :unprocessable_entity
        end
      end

      def refresh
        session = JWTSessions::Session.new(payload: claimless_payload, refresh_by_access_allowed: true)
        @tokens = session.refresh_by_access_payload do
          raise JWTSessions::Errors::Unauthorized, 'Malicious activity detected'
        end
        set_jwt_cookies
        render json: { csrf: @tokens[:csrf] }
      end

      def logout
        session = JWTSessions::Session.new(payload: payload)
        session.flush_by_access_payload
        render json: :ok
      end


      private

      helper_method :tokens, :parent_params

      def set_parent
        @parent = Parent.find(parent_params.require(:id))
      end

      def parent_params
        @parent_params ||= params.permit(:email, :password, :id)
      end

      def password_params
        parent_params.require(:password)
      end

      def email_params
        parent_params.require(:email)
      end

      def set_jwt_session
        payload  = { parent_id: @parent.id }
        session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
        @tokens = session.login
        set_jwt_cookies
      end

      def set_jwt_cookies
        response.set_cookie(JWTSessions.access_cookie, value: @tokens[:access], httponly: true, secure: Rails.env.production?)
      end

      def success_response
        render json: { message: 'parent correctly signed in', csrf: @tokens[:csrf], parent_id: @parent.id }, status: :ok
      end
    end
  end
end
