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

class Goal < ActiveRecord::Base
  has_many :savings
  belongs_to :user

  validates :goal_amount, presence: true, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than => 0}
  validates :name, presence: true, :length => { :in => 2..20 }
  accepts_nested_attributes_for :savings

  def apply_amount
    update_goal_amount
    update_saved_amount
    self.save
  end 

  def update_goal_amount
    self.savings.each do |saving| 
      self.goal_amount -= saving.amount
    end 
  end 

  def update_saved_amount
    self.savings.each do |saving| 
      self.saved_amount += saving.amount
    end 
  end 

end
