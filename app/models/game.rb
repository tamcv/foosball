class Game < ActiveRecord::Base
  validates :number, presence: true, inclusion: [1, 2, 3]
end
