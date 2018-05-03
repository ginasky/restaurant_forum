class Restaurant < ApplicationRecord
  validates_presence_of :name, :opening_hours
end
