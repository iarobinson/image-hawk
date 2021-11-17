class Session < ApplicationRecord
  belongs_to :user

  has_many_attached :images do |attachable|
    attachable.variant :thumb, resize: "400x400"
  end
end
