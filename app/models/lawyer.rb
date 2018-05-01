class Lawyer < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  validates_presence_of :first_name, :last_name, :state
  validates :lawyer_id, presence: false
  has_many :users
  mount_uploader :avatar, AvatarUploader

end
