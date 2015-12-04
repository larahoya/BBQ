class Item < ActiveRecord::Base
  belongs_to :barbecue
  belongs_to :user

  def get_user
    User.find_by(id: user_id).name
  end

end
