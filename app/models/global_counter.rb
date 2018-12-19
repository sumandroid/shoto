class GlobalCounter
  @@current_counter = 100

  class << self
    def get_next_counter_value
      @@current_counter += 1
      return @@current_counter
    end
  end
end
