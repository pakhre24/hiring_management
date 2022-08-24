class CreateInterviewSkillRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :interview_skill_ratings do |t|
      t.references :interview, null: false, foreign_key: true
      t.references :core_skill, null: false, foreign_key: true
      t.decimal :score, precision: 2, scale: 1, default: 0.0

      t.timestamps
    end
  end
end
