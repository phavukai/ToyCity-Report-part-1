require 'json'
path = File.join(File.dirname(__FILE__), '../data/products.json')
file = File.read(path)
products_hash = JSON.parse(file)

# Print today's date
time = Time.now
puts ""
puts time


puts "                     _            _       "
puts "                    | |          | |      "
puts " _ __  _ __ ___   __| |_   _  ___| |_ ___ "
puts "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
puts "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
puts "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
puts "| |                                       "
puts "|_|                                       "
puts ""


# For each product in the data set:
products_hash["items"].each do |toy|

# Variables for products
# total is the price of toy
total = 0.0	
avg = 0
tota_purch = 0
discount = 0.0
	

  # Print the name of the toy
puts "######################"
print "Name of toy: "
puts  toy["title"]


  # Print the retail price of the toy
print "Retails price: "
puts toy["full-price"]


  # Calculate and print the total number of purchases
print "Number of purchases: "
puts toy["purchases"].length


  # Calculate and print the total amount of sales
toy["purchases"].each do |buy|
	total += buy["price"]
		total_purch = toy["purchases"].length

avg = total / total_purch
discount = (( toy["full-price"].to_i - avg ) / toy["full-price"].to_i) * 100

 end

 puts "Total sales: $#{total}"


  # Calculate and print the average price the toy sold for
puts "Average price of toy sold: $#{avg}"


  # Calculate and print the average discount (% or $) based off the average sales price
puts "Average discount: %#{discount.round(2)}"

puts "######################"
puts ""
end
	puts " _                         _     "
	puts "| |                       | |    "
	puts "| |__  _ __ __ _ _ __   __| |___ "
	puts "| '_ \\| '__/ _` | '_ \\ / _` / __|"
	puts "| |_) | | | (_| | | | | (_| \\__ \\"
	puts "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
	puts

# For each brand in the data set:

unique_brands = products_hash["items"].map { |item| item["brand"]}.uniq
	unique_brands.each_with_index do |brand,index|
		brand_toys = products_hash["items"].select { |item| item["brand"]==brand}

#Variables for brands

toy_stock = 0
brand_price = 0
brand_avg = 0
toy_price = 0


  # Print the name of the brand
puts ""
puts "######################"
 
	puts "Brand name: #{brand}"


  # Count and print the number of the brand's toys we stock
brand_toys.each {|toy|toy_stock += toy["stock"].to_i }
	puts "Stock: #{toy_stock}"


  # Calculate and print the average price of the brand's toys

brand_toys.each {|toy|brand_price += toy["full-price"].to_i }
	brand_avg = brand_price / brand_toys.length
		puts "Brand average price: #{brand_avg}"

  # Calculate and print the total revenue of all the brand's toy sales combined

brand_profit = 0
brand_toys.each do |item|
	item["purchases"].each do |el|
		brand_profit += el["price"].to_f
	end
end

puts "Brand profit: #{brand_profit.round(2)}"
puts "######################"
puts ""


end
