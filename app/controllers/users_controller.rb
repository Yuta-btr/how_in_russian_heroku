class UsersController < ApplicationController

  def show
    # @user = User.find(params[:id]) # ActiveRecord::RecordNotFound - Couldn't find User without an ID:
    # binding.pry
    @user = User.find(current_user.id)
    # puts @user.name
    # puts params
  end

end
