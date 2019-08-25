# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


if Rails.env.development?
	Contest.destroy_all

	Contest.create!(
		start_week: 1,
		end_week: 1,
		entry_fee: 11.00,
		guaranteed_prize_pool: 100.00,
		current_entrants: 0,
		max_entrants: 10
	)
end