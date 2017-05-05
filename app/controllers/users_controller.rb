class UsersController < ApplicationController
  def show
    # raise params.inspect
    @user = User.find(params[:id])
    # raise @user.inspect

  end

  
end
