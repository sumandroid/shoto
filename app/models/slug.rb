class Slug

  @@slugs = {}
  @@url_to_slug_map = {}

  class << self

    def find_by(criteria: , value:)
      case criteria.to_s
      when 'long_url'
        @@url_to_slug_map[value.to_sym]
      when 'slug'
        @@slugs[value.to_sym]
      else
        return nil
      end
    end

    def update_slug_map(slug:, long_url:, created_at:)
      @@slugs[slug.to_sym] = { long_url: long_url, created_at: created_at}
      update_url_to_slug_map(slug: slug, long_url: long_url, created_at: created_at)
    end

    def update_url_to_slug_map(slug:, long_url:, created_at:)
      @@url_to_slug_map[long_url.to_sym] = slug
    end

    def get_all_slugs_to_url_map
      @@slugs
    end

    def remove_slug(slug)
      existing_slug = @@slugs[slug.to_sym]
      if existing_slug.present?
        @@slugs.delete(slug.to_sym)
        @@url_to_slug_map.delete(existing_slug[:long_url].to_sym)
      end
    end

  end

end
