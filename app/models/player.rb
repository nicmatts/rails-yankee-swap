class Player < ActiveRecord::Base

  validates :name, presence: true
  belongs_to :game
  has_one :gift

end
