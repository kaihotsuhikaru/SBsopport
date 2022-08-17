class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.references :user, foreign_key: true, null: false
      t.boolean :is_active, default: true, null: false

      t.timestamps
    end
  end
end
