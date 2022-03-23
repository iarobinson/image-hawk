class Charge < ApplicationRecord
  has_one :asset
  belongs_to :purchaser, class_name: 'User', optional: true 
  belongs_to :seller, class_name: 'User'
  belongs_to :session

  def full_size_asset_storage_url(asset_id)
    ActiveStorage::Attachment.find(asset_id)
  end
end
