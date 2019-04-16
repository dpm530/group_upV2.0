class Event < ApplicationRecord
  belongs_to :group, required: true
  belongs_to :location, required: true
  has_many :attendances, dependent: :destroy
  has_many :users, through: :attendances, source: :user
  has_many :comments, dependent: :destroy
end
