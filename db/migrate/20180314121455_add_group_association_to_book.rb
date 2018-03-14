class AddGroupAssociationToBook < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :book_id, :integer
    add_index 'groups', ['book_id'], name: 'index_book_id'
  end
end
