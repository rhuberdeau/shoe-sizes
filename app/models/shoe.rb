class Shoe < ActiveRecord::Base
  validates :size,
            presence: true,
            numericality: { greater_than: 0 }
            
  belongs_to :friend
  
  def self.highest
    self.maximum("size")
  end
end
