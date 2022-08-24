class User < ApplicationRecord
	validates :name, :email, :presence => true
	validates :experience, presence: true, :numericality => {:greater_than => 0}
	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
	validate :core_skills_present

	has_many :user_core_skills, :as => :skillable, :dependent => :destroy, :class_name => "UserCoreSkill"
	has_many :skills, :through => :user_core_skills, :source => :core_skill 
	
	accepts_nested_attributes_for :user_core_skills

  private

  def core_skills_present
    errors.add(:skills, 'should be present.') unless skills.present?
  end

end
