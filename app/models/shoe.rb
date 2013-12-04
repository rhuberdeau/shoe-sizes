class Shoe < ActiveRecord::Base
  validates :size,
            presence: true,
            numericality: { greater_than: 0 }
            
  belongs_to :friend
  
  def self.highest
    self.maximum("size")
  end
  
  def self.lowest
    self.minimum("size")
  end
  
  def self.average_size
    self.average("size")
  end
end
