class Jury
	attr_accessor :members

	def initialize
		@members = []
	end

	def add_member(name)
		@members << name
	end

	def cast_votes(finalists)
		puts "-" * 30
		@finalist_one = finalists[0]
		@finalist_two = finalists[1]
		@votes = Hash[finalists[0], 0, finalists[1], 0]
		@members.each do |member|
			#puts finalists
			vote = finalists.sample
			@votes[vote] +=1
			puts "#{member.name} " + "voted for " + "#{vote}"
		end
		puts "-" * 30
		return @votes
	end

	def report_votes(final_votes)
		puts "#{@finalist_one} - #{@votes[@finalist_one]}"
		puts "#{@finalist_two} - #{@votes[@finalist_two]}"
	end

	def announce_winner(final_votes)
		winner = final_votes.key(final_votes.values.max)
		puts "#{winner} is the winner!"
		return winner
	end
end