class ChartsController < ApplicationController
  def frequency
    @shoes = Shoe.frequency_of_size
  end
end