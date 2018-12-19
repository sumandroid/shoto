class Api::V1::SlugsController < ApplicationController

  respond_to :json

  def index
    render json: SlugSerializer.collection_as_json
  end

  def create
    long_url = get_long_url_from_params
    valid_url = Slugs::UrlSanitizerService.new(long_url).validate
    render_bad_request and return unless valid_url
    slug = Slugs::GeneratorService.new(long_url).run
    render_success(SlugSerializer.slug_as_json(slug)&.merge({slug: slug}))
  end

  def delete
  	render_bad_request and return unless params[:slug].present?
  	slug = get_slug_from_params
  	Slug.remove_slug(slug)
  	render_success
  end

  def get_by_slug
  	slug = params[:slug]
  	render_bad_request and return unless slug.present?
    render_success(SlugSerializer.slug_as_json(slug)&.merge({slug: slug}))
  end

  private

  def get_long_url_from_params
  	(params['_json'].present? ? JSON.parse(params['_json'])&.dig('long_url') : nil) || params[:long_url]
  end

  def get_slug_from_params
  	(params['_json'].present? ? JSON.parse(params['_json'])&.dig('slug') : nil) || params[:slug]
  end

end
