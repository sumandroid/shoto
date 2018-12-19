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
      !(unsanitized_url =~ /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix).eql? nil #checking the url validity with URI regex, if it is valid it returns zero otherwise nil
    end

    private

    attr_accessor :unsanitized_url
  end
end
