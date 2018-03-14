ActiveAdmin.register Author do

  permit_params :name

  show do
    attributes_table do
      row :name
      row :books do |author|
        ul do
          author.books.each do |book|
            li book.title.present? ? book.title : 'Nothing'
          end
        end
      end
    end
  end
end
