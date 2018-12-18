module Slugs
  class UrlSanitizerService

    def initialize(unsanitized_url)
      @unsanitized_url = unsanitized_url
    end

    def sanitize
      sanitized_url = unsanitized_url.strip.downcase.gsub(/(https?:\/\/)|(www\.)/, '') #removing the http:, https: and www part from url
      sanitized_url.slice!(-1) if sanitized_url[-1] == '/'
      return sanitized_url
    end

    private

    attr_accessor :unsanitized_url
  end
end
