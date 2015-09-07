# This file should contain all the record creation needed to seed the
# database with its default values.
# The data can then be loaded with the rake db:seed (or created
# alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

Book.transaction do
  CSV.foreach(Rails.root.join('db/csv/books.csv'), headers: true) do |row|
    binding.pry
    Book.find_or_initialize_by(name: row['name']).update(row.to_hash)
  end
end
