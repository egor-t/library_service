50.times do
  title = Faker::Book.title
  image_url = Faker::Internet.url
  Book.create!(title:  title, image_url: image_url)
end
