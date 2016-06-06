# == Schema Information
#
# Table name: savings
#
#  id         :integer          not null, primary key
#  category   :string
#  amount     :decimal(5, 2)
#  goal_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SavingsController < ApplicationController

  def index
    @goal = Goal.find(params[:goal_id])
    @savings = @goal.savings
  end 

  def show
    goal = Goal.find(params[:goal_id])
    @saving = goal.savings.find(params[:id])
  end 

  def edit
    @goal = Goal.find(params[:goal_id])
    @saving = @goal.savings.find(params[:id])
  end 

  def new
    @goal = Goal.find(params[:goal_id])
    @saving = @goal.savings.build
  end 

  def create
    goal = Goal.find(params[:goal_id])
    @saving = goal.savings.build(saving_params)
    goal.apply_amount

    if @saving.save 
      redirect_to([@saving.goal, @saving], :notice => 'Saving applied to goal.')
    else 
      render 'new'
    end 
  end 

  def update
    @goal = Goal.find(params[:goal_id])
    @saving = @goal.savings.find(params[:id])
    @goal.apply_amount

    if @saving.update_attributes(saving_params)
      redirect_to [@saving.goal, @saving], :notice => 'Saving was successfully updated.'
    else 
      render 'edit'
    end 
  end 

  def destroy
    goal = Goal.find(params[:goal_id])
    @saving = goal.savings.find(params[:id])
    @saving.destroy
    goal.apply_amount

    redirect_to goal_savings_path(goal)
  end 

  private

  def saving_params
    params.require(:saving).permit(:category, :amount)
  end 

end
