class Tribe
	attr_reader :name, :members

	def initialize(options = {})
		@name = options[:name]
		@members = options[:members] 
		puts @name
	end

	def to_s
		@name
	end

	def tribal_council(options = {})
		@immune = options[:immune]
		@non_immune_members = @members.shuffle
		@non_immune_members.each do |member|
			if member != @immune
				return member
			end
		end
	end
end