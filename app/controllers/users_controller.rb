class UsersController < ApplicationController
	before_action :authenticate_user!
	def index
		@templates = current_user.templates
	end
end
