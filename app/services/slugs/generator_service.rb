module Slugs
  class GeneratorService

    def initialize(long_url)
      return nil unless long_url.present?
      @long_url = long_url
    end

    def run
      sanitize_url
      check_for_existing_slug	
      if @existing_slug.present?
      	return @existing_slug
      else
      	generate_new_slug
      	update_slug_maps
      end
    end

    private

    def sanitize_url
      @sanitized_url = Slugs::UrlSanitizerService.new(long_url).run
    end

    def check_for_existing_slug
    	@existing_slug = Slug.find_by_long_url(sanitized_url)	
    end

    def generate_new_slug
    	@new_generated_slug = Slugs::KeyGeneratorService.new.run
    end

    def update_slug_maps
    	Slug.update_slug_to_long_url_map(slug: new_generated_slug, long_url: long_url)
    	Slug.update_long_url_to_slug_map(slug: new_generated_slug, long_url: long_url)
    end


    attr_accessor :long_url, :sanitized_url, :existing_slug, :new_generated_slug
  end
end