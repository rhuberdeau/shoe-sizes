class ChartsController < ApplicationController
  def frequency
    render :json => Shoe.frequency_of_size
  end
end