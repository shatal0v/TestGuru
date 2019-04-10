class BagesController < ApplicationController
  def index
    @bages = Bage.all
    @user_bages = current_user.bages
  end
end
