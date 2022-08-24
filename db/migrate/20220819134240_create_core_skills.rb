class CreateCoreSkills < ActiveRecord::Migration[6.1]
  def change
    create_table :core_skills do |t|
      t.string :name

      t.timestamps
    end
  end
end
