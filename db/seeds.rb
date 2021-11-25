# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Movie.create([
  { title: "Holidate" },
  { title: "Home Alone" },
  { title: "Wedding Crashers" },
  { title: "A Walk To Remember" },
  { title: "The Boy Call Christmas" },
  { title: "The Matrix" }
])

holidate = Movie.first
home_alone = Movie.second
wedding_crashers = Movie.third
a_walk_to_remember = Movie.fourth
the_boy_call_christmas = Movie.fifth
the_matrix = Movie.where(title: "The Matrix")

romantic = Genre.create({ name: "Romantic" })
drama = Genre.create(name: "Drama")
comedy = Genre.create({ name: "Comedy" })
seasonal = Genre.create({ name: "Seasonal" })
action = Genre.create({ name: "Action" })
sci_fi = Genre.create({ name: "Sci-Fi" })

holidate.update(genres: [ romantic, drama ])
home_alone.update(genres: [ comedy, seasonal ])
wedding_crashers.update(genres: [ comedy, romantic ])
a_walk_to_remember.update(genres: [ romantic ])
the_boy_call_christmas.update(genres: [ drama, seasonal ])
the_matrix.update(genres: [ action, sci_fi ])