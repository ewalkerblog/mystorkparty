class StaticPagesController < ApplicationController
  def home
  @user = current_user
  @registries = Registry.search(params[:search])
  @registries = Registry.all
  end  
end
