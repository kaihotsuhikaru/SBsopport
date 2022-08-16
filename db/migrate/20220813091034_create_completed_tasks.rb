class CreateCompletedTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :completed_tasks do |t|
      t.references :user
      t.references :task, unique: true
      t.datetime :start_time
      t.timestamps
    end
  end
end
