class User < ActiveRecord::Base
  has_many :surveys
  has_many :submissions
  has_many :responses, through: :submissions

  has_secure_password
  validates_presence_of :username, :password
  validates_uniqueness_of :username


end
