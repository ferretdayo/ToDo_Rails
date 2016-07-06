class CreateTodoLists < ActiveRecord::Migration[5.0]
  def change
    create_table :todo_lists do |t|
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
