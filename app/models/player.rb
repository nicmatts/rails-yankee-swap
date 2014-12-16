class Player < ActiveRecord::Base

  validates :name, uniqueness: true
  belongs_to :game
  has_one :gift

end
