# This makes it so editing something with many photos, rails doesn't delete the previously uploaded photos
Rails.application.config.active_storage.replace_on_assign_to_many = false