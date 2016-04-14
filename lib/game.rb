require_relative "colorizr/lib/colorizr"
class Game
	attr_reader :tribes

	def initialize(tribe_one, tribe_two)
		@tribe_one = tribe_one
		@tribe_two = tribe_two
		color_tribes(@tribe_one, @tribe_two)
		@tribes = [@tribe_one, @tribe_two]
	end

	def color_tribes(one, two)
		one.name = one.name.red
		two.name = two.name.blue
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
		@new_tribe = Tribe.new(name: merged_tribes.yellow, members: [])
		@tribe_one.members.each do |member|
			@new_tribe.members << member
		end
		@tribe_two.members.each do |member|
			@new_tribe.members << member
		end
		clear_tribes
		add_tribe(@new_tribe)
		return @tribes[0]
	end

	def individual_immunity_challenge
		tribe = @tribes[0]
		winner = tribe.members.sample
		puts "#{winner} won the immunity challenge!"
		return winner
	end

	def eliminate
		if immunity_challenge == @tribe_one
			losing_member = @tribe_one.members.sample
			@tribe_one.members.delete(losing_member)
			puts "#{losing_member} was eliminated from #{@tribe_one}!"
			return @tribe_one
		else
			losing_member = @tribe_two.members.sample
			@tribe_two.members.delete(losing_member)
			puts "#{losing_member} was eliminated from #{@tribe_two}!"
			return @tribe_two
		end
	end

end