require 'colorizr'
class Tribe
	attr_accessor :name, :members

	def initialize(options = {})
		@name = options[:name]
		@members = options[:members]
		puts "New tribe: #{@name}"
	end

	def to_s
		@name
	end

	def tribal_council(options = {})
		@immune = options[:immune]
		@non_immune_members = []
		@members.each do |member|
			@non_immune_members << member
		end
		@non_immune_members.delete(@immune)
		eliminated_member = @non_immune_members.sample
		delete_members(eliminated_member)
		puts "#{eliminated_member.name} from #{@name} was voted off the island!"
		return eliminated_member
	end

	def delete_members(eliminated_member)
		@members.delete(eliminated_member)
		return @members
	end
end