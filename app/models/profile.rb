class Profile < ApplicationRecord
  belongs_to :user
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :profile_name, presence: true
  validates :about, length: {maximum: 400}
end
