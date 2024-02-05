class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find(user_params[:id])
  end

  private

    def user_params
      params.permit(:id, :name, :email)
    end
end
