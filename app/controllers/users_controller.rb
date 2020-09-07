class UsersController < ApplicationController
  before_action :move_to_new

  def new
    @user = User.new
  end

  def destroy
  end

  def create
    @user = User.create(user_params)
  end

  private

  def user_params
    params.require(:user).permit(
      :nickname, :frist_name, :family_name, :frist_name_kana, :family_name_kana, :birth
    )
  end

  def move_to_new
    unless user_signed_in?
      redirect_to action: :new
    end
  end
end
