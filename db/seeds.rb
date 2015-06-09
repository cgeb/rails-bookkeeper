# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Classification.create!(name: "Asset", created_at: Time.now, updated_at: Time.now)
Classification.create!(name: "Liability", created_at: Time.now, updated_at: Time.now)
Classification.create!(name: "Equity", created_at: Time.now, updated_at: Time.now)
Classification.create!(name: "Revenue", created_at: Time.now, updated_at: Time.now)
Classification.create!(name: "Expense", created_at: Time.now, updated_at: Time.now)