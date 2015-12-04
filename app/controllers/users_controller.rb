class UsersController < ApplicationController

  def show
    @barbecues = User.find_by(id: current_user.id).barbecues
  end
  
end
