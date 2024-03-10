class ShippingsController < ApplicationController
  def index
    @shipping = Shipping.new
  end
end
