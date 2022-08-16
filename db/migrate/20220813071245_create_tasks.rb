class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.references :user, foreign_key: true, null: false
      t.boolean :is_active, default: true, null: false
      t.datetime :created_at
      t.datetime :updated_at
      t.timestamps
    end
  end
end
