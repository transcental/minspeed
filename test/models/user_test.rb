# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  email       :string
#  first_name  :string
#  is_admin    :boolean
#  last_name   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  identity_id :string
#  slack_id    :string
#
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
