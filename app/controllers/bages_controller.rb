class BagesController < ApplicationController
  def show
    @bages = current_user.bages
  end
end
