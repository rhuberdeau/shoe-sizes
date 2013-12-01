class Friend < ActiveRecord::Base
  validates :name,
            presence: true
            
  validates :age,
            presence: true
            
  has_one :shoe
end
