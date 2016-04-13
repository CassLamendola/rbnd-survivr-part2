class Tribe
	attr_accessor :name, :members

	def initialize(options = {})
		@name = options[:name]
		@members = options[:members] 
		puts "New Tribe: #{@name}"
	end

	def to_s
		@name
	end

	def tribal_council(options = {})
		@immune = options[:immune]
		#puts "immune: #{@immune}"
		@non_immune_members = []
		@members.each do |member|
			@non_immune_members << member
		end
		#puts "non_immune_members #{@non_immune_members}"
		@non_immune_members.delete(@immune)
		#puts non_immune_members
		eliminated_member = @non_immune_members.sample
		delete_members(eliminated_member)
		#puts "#{@members} after elimination"
		puts "#{eliminated_member.name} was voted off!"
		return eliminated_member
	end

	def delete_members(eliminated_member)
		@members.delete(eliminated_member)
		#puts "deleting"
		return @members
	end
end