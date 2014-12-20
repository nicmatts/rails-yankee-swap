class Game < ActiveRecord::Base

  validates :name, uniqueness: true
  has_many :players
  has_many :gifts

end
