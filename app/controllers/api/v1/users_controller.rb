module Api
  module V1
    class UsersController < ApplicationController
      # TODO See herer to better organize the errors in Rails API: https://medium.com/rails-ember-beyond/error-handling-in-rails-the-modular-way-9afcddd2fe1b

      def index
        @users = User.all
        render json: @users, status: :ok
      end

      def show
        begin
          @user = User.find(user_id)
          render json: @user, status: :ok
        rescue => e
          render json: user_error
        end
      end


      private

      def user_id
        params[:id]
      end

      def user_error
        {
          status: 404,
          message: 'The requested user was not found'
        }
      end
    end
  end
end
