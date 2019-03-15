class Comment < ApplicationRecord
  belongs_to :user, required: true
  belongs_to :event, required: true
end
