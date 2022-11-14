class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.references :user, foreign_key: true, null: false
      t.boolean :is_active, default: true, null: false
      t.string :title
      t.text :content
      t.text :category
      t.integer :rating
      t.datetime :start_time

      t.timestamps
    end
  end
end
