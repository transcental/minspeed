# == Schema Information
#
# Table name: team_users
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  team_id    :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_team_users_on_team_id  (team_id)
#  index_team_users_on_user_id  (user_id)
#
# Foreign Keys
#
#  team_id  (team_id => teams.id)
#  user_id  (user_id => users.id)
#
class TeamUser < ApplicationRecord
  belongs_to :user
  belongs_to :team
end
