module CoreSkillsHelper

	def core_skills(cs_ids=[])
		p "==#{cs_ids}="
		cs_ids.present? ? CoreSkill.select('id, name').where(id: cs_ids).map{ |r| ["#{r.name}", r.id ] } : CoreSkill.select('id, name').all
	end

end
