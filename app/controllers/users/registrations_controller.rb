class Users::RegistrationsController < Devise::RegistrationsController
	def create
		super # Inherite work
		role = Role.find_by_name("user")
		user = User.last
		user.role_id = role.id
		user.save!
	end
end