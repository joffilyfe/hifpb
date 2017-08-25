class Admin::UserController < Admin::AdminController
  before_action :set_user, only: %i[edit update]
  before_action :set_authorization, only: [:index, :edit, :update]

  def index
    authorize User
    @users = User.all.paginate :page => params[:page], :per_page => 10
  end

  def edit
    @permissions = Permission.all
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to admin_url, notice: 'Usuário atualizado com sucesso' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_authorization
      authorize User
    end

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(permission_ids: [], course_ids: [])
    end
end
