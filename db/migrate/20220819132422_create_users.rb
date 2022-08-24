class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :type
      t.string :name
      t.date :dob
      t.string :email
      t.decimal :experience, precision: 4, scale: 2, default: 0.0

      t.timestamps
    end
  end
end
