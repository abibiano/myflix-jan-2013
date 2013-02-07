class Video < ActiveRecord::Base
	belongs_to :category

	validates :title, presence: true
	validates :description, presence: true

  has_many :reviews, order: "created_at DESC"

	def self.search_by_title(search_term)
    if search_term.blank?
      []
    else
		  where("title LIKE ?", "%#{search_term}%").order("created_at DESC")
    end
	end

  def average_rating
    reviews.average(:rating).to_f.round(1)
  end
end