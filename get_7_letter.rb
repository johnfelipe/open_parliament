f = File.open("words.txt", "w")
count = Statement.count

(count).times do |i|
	s = Statement.find(i+2) # This breaks at when a record doesn't exist
	w = s.content_en.split(" ")
	w = w.select{ |w| w.length > 7 && !w.include?("<") }
	w.uniq!
	w.each { |w| f.puts "#{w}"  }
end
