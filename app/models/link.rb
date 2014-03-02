class Link < ActiveRecord::Base
  belongs_to :survey

  after_create  :generate_link
  validates :survey_id, presence: true
  validates :unique_link, uniqueness: true
  def generate_link
    self.unique_link = SecureRandom.base64(15).gsub(/\W/,"")
    self.save
  end

  def participation
    Participation.where(user_link: unique_link).first
  end
end
