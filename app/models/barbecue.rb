class Barbecue < ActiveRecord::Base
  validates :title, presence: true
  validates :venue, presence: true
  validates :date, presence: true
  has_many :users, through: :participations
  has_many :participations
  has_many :items

  def items_user
    items_list = []
    if self.items.length > 0
      self.items.each do |item|
        items_list.push({'name': item.name, 'user': item.get_user})
      end
    end
    return items_list
  end

end
