class Jury
	attr_accessor :members

	def initialize
		@members = []
	end

	def add_member(name)
		@members << name
	end

	def cast_votes(finalists)
		@finalist_one = finalists[0]
		@finalist_two = finalists[1]
		@votes = Hash[@finalist_one, 0, @finalist_two, 0]
		@members.each do |member|
			vote = finalists.sample
			@votes[vote] +=1
			puts "#{member} " + "-" + "#{vote}"
		end
		return @votes
	end

	def report_votes(final_votes)
		puts @votes[@finalist_one]
		puts @votes[@finalist_two]
	end

	def announce_winner(final_votes)
		final_votes.key(final_votes.values.max)
	end
end