# == Schema Information
#
# Table name: goals
#
#  id            :integer          not null, primary key
#  name          :string
#  goal_amount   :decimal(10, 2)
#  saved_amount  :decimal(10, 2)   default(0.0)
#  goal_progress :integer          default(0)
#  goal_met      :boolean          default(FALSE)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#

class GoalsController < ApplicationController
  before_filter :current_user

  def current_user
    @current_user = @current_user || User.find_by(id: session[:user_id])
  end 

  def index
    @goals = Goal.all
  end 

  def new
    @goal = Goal.new
    @saving = @goal.savings.build
  end 

  def show
    @goal = Goal.find(params[:id])
  end 

  def create
    @goal = Goal.new(goal_params)
    if @goal.valid? 
      @goal.save
      redirect_to goal_path(@goal)
    else 
      render 'new'
    end 
  end 

  def edit
    @goal = Goal.find(params[:id])
    @goal.savings.build
  end 

  def update
    @goal = Goal.find(params[:id])
    @goal.update(goal_params)
    if @goal.valid?
      @goal.update(goal_params)
      redirect_to goal_path(@goal)
    else 
      render 'edit'
    end 
  end 

  private

  def goal_params
    params.require(:goal).permit(:name, :goal_amount, :saving_attributes => [:category, :amount])
  end

end
