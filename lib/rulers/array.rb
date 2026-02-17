class Array
	def deeply_nested?
		empty? || all?(&:empty?)
	end
end
