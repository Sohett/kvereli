module Front
  class HomepageController < ActionController::Base
    respond_to :html

    def index
      render "front/homepage"
    end
  end
end
