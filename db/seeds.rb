500.times do
	employee = Employee.create!(
		first_name: 				Faker::Name.first_name,
		last_name:  				Faker::Name.last_name,
		day_of_birth: 			Faker::Date.between(20.years.ago, 50.years.ago),
		place_of_birth: 		Faker::Address.city,
		salary: 						rand(50000..500000) / 100,
		experience: 				rand(1..10),
		onsite: 						rand(2) == 1,
	)
	(0..rand(4)).each do
		employee.laptops.create!(
			product_name: 		Faker::App.name,
			origin: 					Faker::Address.city,
			price: 						rand(60000..200000) / 100,
			from: 						Faker::Date.between(1.year.ago, 1.month.ago)
		)
	end
end