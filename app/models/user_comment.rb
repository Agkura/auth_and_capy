# == Schema Information
#
# Table name: user_comments
#
#  id            :integer          not null, primary key
#  page_owner_id :integer          not null
#  author_id     :integer          not null
#  body          :text             not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class UserComment < ApplicationRecord
end
