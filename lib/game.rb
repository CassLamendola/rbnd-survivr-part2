class Game
	attr_reader :tribes

	def initialize(tribe_one, tribe_two)
		@tribe_one = tribe_one
		@tribe_two = tribe_two
		@tribes = [@tribe_one, @tribe_two]
	end

	def add_tribe(tribe)
		@tribes << tribe
	end

	def immunity_challenge
		challenge_tribes = @tribes.shuffle
		return challenge_tribes.first
	end

	def clear_tribes
		@tribes = []
	end

	def merge(merged_tribes)
		@new_tribe = Tribe.new(tribe: merged_tribes, members: [])
		@new_tribe.members << @tribe_one.members.first
		@new_tribe.members << @tribe_two.members.first
		clear_tribes
		add_tribe(@new_tribe)
		return @new_tribe
	end

	def individual_immunity_challenge
		tribe = @tribes.sample
		return tribe.members.sample
	end

	def eliminate
		if immunity_challenge == @tribe_one
			losing_member = @tribe_one.members.sample
			return @tribe_one.members.delete(losing_member)
		else
			losing_member = @tribe_two.members.sample
			return @tribe_two.members.delete(losing_member)
		end
	end

end