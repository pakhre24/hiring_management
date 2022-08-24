class CreateUserCoreSkills < ActiveRecord::Migration[6.1]
  def change
    create_table :user_core_skills do |t|
      t.references :skillable, polymorphic: true

      t.references :core_skill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
