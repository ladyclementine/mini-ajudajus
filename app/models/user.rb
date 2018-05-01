class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable

  belongs_to :lawyer
  validates_presence_of :first_name, :last_name, :state, :avatar
  validates :lawyer_id, presence: false
  mount_uploader :avatar, AvatarUploader


end
