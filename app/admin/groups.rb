ActiveAdmin.register Group do
  permit_params :name, book_ids: []


  form do |f|
    f.input :name
    f.input :books, as: :check_boxes, collection: Book.all.map { |x| [x.title, x.id] }
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :books do |group|
        ul do
          group.books.each do |book|
            li book.title.present? ? book.title : 'Nothing'
          end
        end
      end
    end
  end
end
