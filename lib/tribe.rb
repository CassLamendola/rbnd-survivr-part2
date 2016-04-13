class Tribe
	attr_accessor :name, :members

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
		non_immune_members = @members
		non_immune_members.delete(@immune)
		eliminated_member = non_immune_members.sample
		@members.delete(eliminated_member)
		return eliminated_member
	end
end