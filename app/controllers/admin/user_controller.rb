class Admin::UserController < Admin::AdminController
	def index
		@users = User.all
	end

	# def create
	# 	puts 'passa aqui'
	# end
end
