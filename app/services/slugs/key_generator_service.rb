module Slugs
  class KeyGeneratorService
  	@@chars = ['0'..'9', 'A'..'Z', 'a'..'z'].map { |range| range.to_a }.flatten

    def initialize
      @global_counter_value = GlobalCounter.get_next_counter_value
    end

    def run
      encode_key
      return encoded_key
    end

    private

    def encode_key
      @encoded_key = Base64.urlsafe_encode64(global_counter_value.to_s) + 3.times.map { @@chars.sample }.join
    end

    attr_accessor :global_counter_value, :encoded_key
  end
end
