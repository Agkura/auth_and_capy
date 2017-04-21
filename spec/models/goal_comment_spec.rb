# == Schema Information
#
# Table name: goal_comments
#
#  id           :integer          not null, primary key
#  goal_id      :integer          not null
#  commenter_id :integer          not null
#  body         :text             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe GoalComment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
