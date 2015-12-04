class ItemsController < ApplicationController

  def create
    barbecue = Barbecue.find(params[:id])
    name = params["name"]
    item = barbecue.items.new(barbecue_id: barbecue.id, name: name, user_id: current_user.id)
    if item.save
      render status: 201, json: {'name': item.name, 'user': current_user.name}
    else
      render status: 404, json: {error: 'Error'}
    end
  end

end
