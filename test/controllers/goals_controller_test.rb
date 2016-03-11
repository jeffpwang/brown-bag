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

require 'test_helper'

class GoalsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
end
