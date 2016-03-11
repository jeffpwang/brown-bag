# == Schema Information
#
# Table name: savings
#
#  id         :integer          not null, primary key
#  category   :string
#  amount     :integer
#  goal_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Saving < ActiveRecord::Base
  validates :category, presence: true 
  validates :amount, presence: true, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than => 0.00}
  belongs_to :goal
  belongs_to :user
end
