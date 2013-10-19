class Response < ActiveRecord::Base
  belongs_to :question
  belongs_to :submission
  belongs_to :choice
  belongs_to :user
  belongs_to :survey
end
