class Emailer < ActiveRecord::Base

	validates :subject, presence: true
  validates :to, presence: true
  validates :body, presence:true
end
