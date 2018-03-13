class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def home
  end
  
  def about
  end   

  def dashboard
    @contents = current_user.contents
    @sales = Sale.where(email_seller: current_user.email)
    @purchased = Sale.where(email_buyer: current_user.email)
  end 
end
