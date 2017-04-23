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
  validates :page_owner_id, :author_id, :body, presence: true

  belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User

  belongs_to :commentable,
    primary_key: :id,
    foreign_key: :page_owner_id,
    class_name: :User

end
