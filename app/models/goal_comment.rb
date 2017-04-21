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

class GoalComment < ApplicationRecord
end
