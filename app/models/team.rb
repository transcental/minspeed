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
class Team < ApplicationRecord
  has_many :team_users, dependent: :destroy
  has_many :users, through: :team_users
  validates :pairing_code, uniqueness: true, presence: true

  before_validation :generate_pairing_code, on: :create

  private

  def generate_pairing_code
    loop do
      self.pairing_code = SecureRandom.alphanumeric(4).upcase
      break unless Team.exists?(pairing_code: pairing_code)
    end
  end
end
