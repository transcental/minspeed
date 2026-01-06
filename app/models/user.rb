class User < ApplicationRecord
  def admin? = is_admin

  def name = "#{first_name} #{last_name}"

  def make_admin! = update!(is_admin: true)

  def remove_admin! = update!(is_admin: false)

  def self.from_hack_club_auth(auth_hash)
    hca_id = auth_hash.dig("uid")
    return nil unless hca_id

    user = find_or_initialize_by(identity_id: hca_id)

    user.email = auth_hash.dig("info", "email")
    user.first_name = auth_hash.dig("info", "first_name")
    user.last_name = auth_hash.dig("info", "last_name")
    user.slack_id = auth_hash.dig("info", "slack_id")
    user.save!
    user
  end
end
