class CreateTaskListTable < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.text :description
      t.boolean :completed
      t.datetime :created_at
    end
  end
end
