require 'nokogiri'
require 'open-uri'
require "awesome_print"


doc = Nokogiri::HTML(open("http://dining.humboldt.edu/j-menu"))


# div class="collapse"

#THE NEXT TWO LINES GO TOGETHER. UNCOMMENT THEM TOGETHER SIL TE PLAIT
#meals =  doc.css("div[class = 'collapse']")[0]
#meals = meals.css("p").text.split(" ")

meals =  doc.css("div[class = 'collapse']")[0].css("p").to_a

breakfast = meals[2].to_s.split("<br>")
lunch = meals[5].to_s.split("<br>")
dinner = meals[8].to_s.split("<br>")


# process and massage the resulting string
bld = [breakfast, lunch, dinner]
bld.each do |meal|

	meal[0].slice!(0..2)


	meal.last.slice!(meal.last.length - 5, meal.last.length)

	meal.each {|option| option.strip!}

end


puts "BREAKFAST"
breakfast.each { |f| puts f}
puts ""
puts "LUNCH"

lunch.each { |f| puts f}
puts ""
puts "DINNER"
dinner.each { |f| puts f}




#We get weird behavior on chars in the html like &
# & is probably worth fixing its pretty common... eggs & bacon....
