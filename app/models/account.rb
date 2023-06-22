class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable

  has_many :properties
  has_many :posts

  mount_uploader :image, ProfileUploader
  mount_uploader :cover_image, ProfileUploader



  def full_name
    "#{first_name}  #{last_name}"
  end

end
