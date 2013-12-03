class Friend < ActiveRecord::Base
  validates :name,
            presence: true
            
  validates :age,
            presence: true,
            numericality: { greater_than: 0 }
            
  has_one :shoe
  accepts_nested_attributes_for :shoe
end
