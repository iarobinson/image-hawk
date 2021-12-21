class Charge < ApplicationRecord
  has_one :asset
  belongs_to :purchaser, class_name: 'User'
  belongs_to :seller, class_name: 'User'
  belongs_to :session
end
