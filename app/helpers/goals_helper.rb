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

module GoalsHelper
end
