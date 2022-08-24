module ApplicationHelper
	def get_user_skills(user)
		user.skills.pluck(:name).join(', ')
	end
end
