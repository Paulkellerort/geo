class AddTagsToUser < ActiveRecord::Migration
  def change
    add_column :users, :tags, :array
    add_index :users, :tags
  end

end
