class AddGroupAssociationToBook < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :group_id, :integer
    add_index 'books', ['group_id'], name: 'index_group_id'
  end
end
