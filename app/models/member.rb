class Member < ApplicationRecord
   has_many :events, dependent: :destroy
   belongs_to :group
   belongs_to :user
end
