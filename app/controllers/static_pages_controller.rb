class StaticPagesController < ApplicationController
    before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]
  def home
    if user_signed_in?
      @user = current_user
    end
  end

  def about
  end

  def contact
  end

  def new
  end
end