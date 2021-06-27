class TopsController < ApplicationController
def index
 if user_signed_in?
   redirect_to purchases_path(current_user)
    end
  end
end