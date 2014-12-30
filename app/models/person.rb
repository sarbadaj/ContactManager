class Person < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :phone_no, presence: true
  validates :email, uniqueness: true
end
