class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.references :user, foreign_key: true, null: false
      t.boolean :is_active, default: true, null: false
      t.string :title
      t.string :task_ja
      t.string :task_en
      t.integer :rating
      t.text :content
      t.datetime :start_time

      t.timestamps
    end
  end
end
