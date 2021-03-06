require 'colorizr'
class Jury
	attr_accessor :members

	def initialize
		@members = []
	end

	def add_member(name)
		puts "#{name.name.light_blue} was added to the jury."
		@members << name
	end

	def cast_votes(finalists)
		@finalist_one = finalists[0]
		@finalist_two = finalists[1]
		color_finalists(@finalist_one, @finalist_two)
		@votes = Hash[finalists[0], 0, finalists[1], 0]
		@members.each do |member|
			vote = finalists.sample
			@votes[vote] +=1
			puts "#{member} " + "voted for " + "#{vote}"
		end
		return @votes
	end

	def color_finalists(one, two)
		one.name = one.name.pink
		two.name = two.name.green
	end

	def report_votes(final_votes)
		puts "#{@finalist_one} got #{@votes[@finalist_one]} votes"
		puts "#{@finalist_two} got #{@votes[@finalist_two]} votes"
	end

	def announce_winner(final_votes)
		winner = final_votes.key(final_votes.values.max)
		puts "#{winner} is the winner!"
		return winner
	end
end