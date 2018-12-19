class SlugSerializer

  class << self

    def index_as_json
      slugs_collection = []
      Slug.get_all_slugs_to_url_map.keys.each do |key|

      end
    end

    def slug_as_json(slug)
      Slug.find_slug_by_long_url
    end

  end
end
