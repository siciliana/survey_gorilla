class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :submissions
  has_many :questions
  has_many :responses, through: :submissions


  def self.generate_shortlink(length=6)
  chars = 'abcdefghijklmnopqrstuvwxyzabABCDEFGHIJKLMNOPQRSTUVWXYZ123456789'
  shortlink = ''
  length.times { |char| shortlink << chars[rand(chars.length)] }
  shortlink
  end

end
