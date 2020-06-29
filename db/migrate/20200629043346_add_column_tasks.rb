class AddColumnTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :end_date, :date
    add_column :tasks, :priority, :integer
    add_column :tasks, :status, :integer
  end
end
