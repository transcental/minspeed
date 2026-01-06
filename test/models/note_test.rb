# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  note       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  team_id    :string
#
require "test_helper"

class NoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
