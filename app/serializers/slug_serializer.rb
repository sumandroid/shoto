class SlugSerializer

  class << self

    def collection_as_json
      render json: Slug.get_all_slugs_to_url_map
    end

    def slug_as_json(slug)
      Slug.find_by(criteria: :slug, value: slug)
    end

    def collection_as_array
      slugs_collection = []
      slugs_map = Slug.get_all_slugs_to_url_map
      if slugs_map.present?
        slugs_map.keys.each do |key|
          slugs_collection << [key, slugs_map[key][:long_url], slugs_map[key][:created_at].strftime("%d %b, %Y %I:%M %P")]
        end
      end
      return slugs_collection
    end

  end
end
