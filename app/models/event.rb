class Event < ApplicationRecord
  belongs_to :group, required: true
end
