class Api::SlugsController < ApplicationController

	def index
	 render json: SlugSerializer.index_as_json
	end

	def create
		long_url = params[:long_url]
		new_slug = Slugs::GeneratorService.new(long_url).run
		render json: SlugSerializer.slug_as_json(new_slug)
	end

	def delete
	end

end