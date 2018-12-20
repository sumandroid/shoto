class SlugsController < ApplicationController

  def index
    respond_to do |format|
      format.html
      format.json do
        render json: SlugSerializer.collection_as_array
      end
    end
  end

  def new
  end

  def redirect
    slug = params[:slug]
    if slug.present?
      slug_map = Slug.find_by(criteria: :slug, value: slug)
      redirect_to slug_map[:long_url] and return if slug_map.present?
    end
    redirect_to slugs_path
  end

end
