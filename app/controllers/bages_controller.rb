class BagesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @bages = Bage.all
    @user_bages = current_user.bages
  end
end
