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
class Note < ApplicationRecord
end
