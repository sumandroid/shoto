module Slugs
  class UrlSanitizerService

    def initialize(unsanitized_url)
      @unsanitized_url = unsanitized_url
    end

    def sanitize
      sanitized_url = unsanitized_url.strip.gsub(/(https?:\/\/)|(www\.)/, '') #removing the http:, https: and www part from url
      sanitized_url.slice!(-1) if sanitized_url[-1] == '/'
      return sanitized_url
    end

    def validate
      !(unsanitized_url =~ /\A#{URI::regexp}\z/).eql? nil #checking the url validity with URI regex, if it is valid it returns zero otherwise nil
    end

    private

    attr_accessor :unsanitized_url
  end
end
