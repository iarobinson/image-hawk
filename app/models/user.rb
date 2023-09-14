class User < ApplicationRecord
  #
  scope :recently_created, -> {
    where("created_at >= ?", Date.today - 2.days)
  }
  #
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :charges

  has_one_attached :avatar
  has_many :sessions

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
