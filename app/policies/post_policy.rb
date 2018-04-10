class PostPolicy < ApplicationPolicy
	def update?
		#case 1 = user of record
		record.user_id == user.id || admin_types.include?(user.type)
	end
end 