# == Schema Information
#
# Table name: goals
#
#  id            :integer          not null, primary key
#  name          :string
#  goal_amount   :integer
#  saved_amount  :integer
#  goal_progress :integer
#  goal_met      :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#

class GoalsController < ApplicationController

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
