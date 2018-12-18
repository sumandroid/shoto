class GlobalCounter
	@@current_counter = 100

	def get_next_counter_value
		@@current_counter += 1
		return @@current_counter
	end
end