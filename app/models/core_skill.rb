class CoreSkill < ApplicationRecord
  has_many :user_core_skills, :dependent => :destroy
  has_many :interview_skill_ratings, :dependent => :destroy
end
