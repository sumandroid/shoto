class Slug

	@@slug_to_long_url_map = {}
	@@long_url_to_slug_map = {}


  def find_slug_by_long_url(sanitized_url)
  	@@long_url_to_slug_map[:sanitized_url]
  end

  def find_long_url_by_slug(slug)
  	@@slug_to_long_url_map[:slug]
  end

  def self.update_slug_to_long_url_map(slug:, long_url:)
  	@@slug_to_long_url_map[slug.to_sym] = long_url
  end

  def self.update_long_url_to_slug_map(slug:, long_url:)
  	@@slug_to_long_url_map[long_url.to_sym] = slug
  end

end
