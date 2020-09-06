class UsersController < ApplicationController
  before_action :move_to_new

  def new
  end

  def destroy
  end

  private

  def move_to_new
    unless user_signed_in?
      redirect_to action: :new
    end
  end
end
