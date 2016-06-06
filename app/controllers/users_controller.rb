# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  email           :string
#  password_digest :string
#

class UsersController < ApplicationController

  def index
    @users = User.all
  end 

  def new
    @user = User.new
  end 

  def show
    @user = User.find(params[:id])
  end 

  def create
    @user = User.new(user_params)
    if @user.valid? 
      @user.save
      redirect_to user_path(@user)
    else 
      render 'new'
    end 
  end 

  def edit
    @user = User.find(params[:id])
  end 

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.valid?
      @user.update(user_params)
      redirect_to user_path(@user)
    else 
      render 'edit'
    end 
  end 

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end
