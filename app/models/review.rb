class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :video

  validates :content, presence: true
  validates :rating, presence: true
  validates :rating, inclusion: 1..5
  validates :user_id, presence: true
  validates :user_id, :uniqueness => { :scope => :video_id }
  validates :video_id, presence: true
end