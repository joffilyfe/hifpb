class Admin::PermissionController < Admin::AdminController
	def index
		@user = User.find(params[:user_id])
		@permissions = Permission.all
	end

	def new
		@user = User.find(params[:user_id])
		@permissions = Permission.all
	end

	def create
		@user = User.find(params[:user_id])
		@permissions = Permission.where('id' => params[:permissions])

		@user.permissions << @permissions

		if @user.save
			redirect_to admin_user_index_path
		else
			render 'index'
		end
	end
	
	def show
		@permission = Permission.find(params[:id])
	end

	def edit
		@user = User.find(params[:user_id])
		
	end

	def update
		@permission = Permission.find(params[:id])
    	if @permission.update(permission_params)
      		redirect_to admin_user_index_path
    	else
      		render 'edit'
    	end
	end

	def destroy
		@permission = Permission.find(params[:id])
    	@permission.destroy

    	redirect_to admin_permissions_path
	end

	private
    def permission_params
      params.require(:user).permit(:registration, :permissions)
    end
end
