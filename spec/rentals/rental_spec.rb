require_relative '../../lib/rentals/customer'
require_relative '../../lib/rentals/movie'
require_relative '../../lib/rentals/rental'
require_relative '../../lib/rentals/statement'


describe "Video Store" do
	let (:customer) { Customer.new("Samuel Customer") }
	let (:new_release_movie) { Movie.new(Movie::NEW_RELEASE, "The Martian") }
	let (:childrens_movie) { Movie.new(Movie::CHILDRENS, "The LEGO Movie") }
	let (:regular_movie) { Movie.new(Movie::REGULAR, "Weekend at Bernie's") }
	let (:classic_movie) { Movie.new(Movie::CLASSIC, "Casablanca") }

	it "prints a receipt" do
		statement = Statement.new(customer)
		statement.add_rental(Rental.new(new_release_movie, customer, 5))
		statement.add_rental(Rental.new(childrens_movie, customer, 5))

		expect(statement.receipt).to eql(
			"Rental Record for Samuel Customer\nOwes: 11.0\nEarned: 2 points"
		)
	end

	it "prints an itemized receipt" do
		statement = Statement.new(customer)
		statement.add_rental(Rental.new(new_release_movie, customer, 5))
		statement.add_rental(Rental.new(childrens_movie, customer, 5))

		expect(statement.itemized_receipt).to eql(
			"Rental Record for Samuel Customer\nThe Martian: 6.5 for 5 days\n"+
			"The LEGO Movie: 4.5 for 5 days\nOwes: 11.0\nEarned: 2 points"
		)
	end
end
