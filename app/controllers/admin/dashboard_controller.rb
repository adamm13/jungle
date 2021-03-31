class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD']

  def show
    @products = Product.all #Setting the variables and will render in ERB template
    @categories = Category.all
  end
end
