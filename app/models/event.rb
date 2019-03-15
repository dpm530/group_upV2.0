class Event < ApplicationRecord
  belongs_to :member, required: true
  belongs_to :group, required: true
end
