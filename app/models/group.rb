class Group < ApplicationRecord
   has_many :members, dependent: :destroy
   has_many :events, dependent: :destroy
   belongs_to :user
   belongs_to :location
end
