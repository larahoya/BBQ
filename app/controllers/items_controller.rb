class ItemsController < ApplicationController

  def create
    barbecue = Barbecue.find(params[:id])
    name = params["name"]
    item = barbecue.items.new(barbecue_id: barbecue.id, name: name)
    if item.save
      render status: 201, json: item
    else
      render status: 404, json: {error: 'Error'}
    end
  end

end
