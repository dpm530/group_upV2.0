class Group < ApplicationRecord
   has_many :members, dependent: :destroy
   has_many :users, through: :members, source: :user
   has_many :events, dependent: :destroy
   has_many :discussions, dependent: :destroy
   has_many :user_posts, through: :discussions, source: :user
   belongs_to :user
   belongs_to :location

   mount_uploader :image, GroupUploader

end
