ActiveAdmin.register Book do

permit_params :avatar, :title, author_ids: []

  index do
    selectable_column
    id_column
    column 'Image', sortable: :avatar_file_name do |book| link_to book.avatar_file_name, book.avatar.url end
    column :avatar_file_size, sortable: :avatar_file_size do |book| book.avatar_file_size.present? ? "#{book.avatar_file_size / 1024} KB" : "nothing" end
    column :created_at
    column :authors do |book|
      book.authors.pluck(:name).join(', ')
    end
    actions
  end

  form do |f|
    tabs do
      tab 'Main info' do
        f.input :title
        f.inputs "Upload" do
          f.input :avatar, required: true, as: :file
        end
      end

      tab 'Auhtors modification' do
        f.input :authors, as: :check_boxes, collection: Author.all.map { |x| [x.name, x.id] }
      end
  end
    f.actions
  end

  show do
    attributes_table do
      row :title
      row :avatar do |book|
        image_tag book.avatar.url(:thumb)
      end
    end
  end


  sidebar 'Authors of this book', only: %i[show edit new] do
    attributes_table_for book do
      row :authors do
        ul do
          book.authors.each do |author|
            li author.name
          end
        end
      end
    end
  end
end
