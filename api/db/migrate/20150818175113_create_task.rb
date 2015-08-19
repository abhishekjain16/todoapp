class CreateTask < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
    end
  end
end
