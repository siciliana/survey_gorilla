class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :submissions
  has_many :questions
  has_many :responses, through: :submissions
end
