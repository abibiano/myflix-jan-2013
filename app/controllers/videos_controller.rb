class VideosController < AuthenticatedController
	def home
		@categories = Category.all
	end

	def show
		@video = Video.find(params[:id]).decorate
		@review = Review.new
	end

	def search
		@videos = Video.search_by_title(params[:search_term])
	end
end