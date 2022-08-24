class CreateInterviews < ActiveRecord::Migration[6.1]
  def change
    create_table :interviews do |t|
      t.integer :candidate_id, null: false, index: true
      t.integer :employee_id, null: false, index: true
      t.text :remarks
      t.decimal :average_rating, precision: 2, scale: 1, default: 0.0
      t.integer :round
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
