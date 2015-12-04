class BarbecuesController < ApplicationController
  before_action :authenticate_user!

  def index
    @barbecues = Barbecue.order(:date)
  end

  def show
    barbecue = Barbecue.find(params[:id])
    @users = barbecue.users
  end

  def new
    @bbq = Barbecue.new
  end

  def create
    bbq_params = params.require(:barbecue).permit(:title, :venue, :date)
    @bbq = Barbecue.new(bbq_params)

    unless @bbq.save
      render(:new)
    else
      redirect_to(barbecues_path)
    end
  end

  def information
    barbecue = Barbecue.find(params[:id])
    render json: barbecue
  end

  def join
    barbecue = Barbecue.find(params[:id])
    user = User.find(current_user.id)
    if barbecue.users.find_by(id: current_user.id) == nil && barbecue.users << user
      render status: 200, json: user
    else
      render status: 404, json: {error: 'Error'}
    end
  end

  def guests
    barbecue = Barbecue.find(params[:id])
    users = barbecue.users
    render json: users
  end

  def items
    barbecue = Barbecue.find(params[:id])
    items = barbecue.items_user
    render json: items
  end

end

