class CreateCompletedTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :completed_tasks do |t|
      t.references :user
      t.references :task, unique: true
      t.datetime :start_time
      t.timestamps
    end
  end
end
