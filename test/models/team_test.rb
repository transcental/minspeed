# == Schema Information
#
# Table name: teams
#
#  id           :integer          not null, primary key
#  name         :string
#  pairing_code :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  team_id      :string
#  user_id      :integer
#
# Indexes
#
#  index_teams_on_user_id  (user_id)
#
require "test_helper"

class TeamTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
