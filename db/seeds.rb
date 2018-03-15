Author.destroy_all
Group.destroy_all
Book.destroy_all
AdminUser.destroy_all

Author.create!(name: 'Aloha')
Group.create!(name: 'General')

# only for pat project
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password',
                  role: 'admin')
