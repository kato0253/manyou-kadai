class AddUserRefToTasks < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :user, foreign_key: true , :unique => true
  end
end
