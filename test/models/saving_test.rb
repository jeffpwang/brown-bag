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

require 'test_helper'

class SavingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
