require 'csv'
class Gossip

	attr_accessor :author ,:content

	def initialize(author, content)
		@author = author
		@content = content
	end
	def save
		CSV.open("./db/gossip.csv", "ab") do |csv|
    	csv << [@author, @content]
  		end
	end
	def self.all
		  all_gossips = []
		  CSV.read("./db/gossip.csv").each do |csv_line|
		    all_gossips << Gossip.new(csv_line[0], csv_line[1])
		  end
		  puts all_gossips
		  return all_gossips
	end

	def find(n)
		nb = Array.new
		csv_list = Array.new
		list = CSV.read("./db/gossip.csv")
		i = 1
		list.each do |line|
			nb << i
			csv_list << line
			i += 1
		end
		last_time = nb.zip(csv_list)
		val = last_time[n.to_i - 1]
		return val
	end
end