class Post < ApplicationRecord
    mount_uploader :image, PhotoUploader

    belongs_to :account
    
    scope :active, -> { where(active: true) }

      # scope for latest blog post
    scope :latest, -> { order created_at: :desc }
end
