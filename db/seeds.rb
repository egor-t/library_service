Author.destroy_all
Book.destroy_all

author = Author.create!(name: 'Aloha')

10.times do
  title = Faker::Book.title
  image_url = Faker::Internet.url
  Book.create!(title: title, image_url: image_url, author_id: author.id)
end
