class Admin::AuthorizationsController < Admin::AdminController
  before_action :admin?

  def index
    @authorizations = Authorization.all
  end
  
  def new
    @authorization = Authorization.new
  end
  
  def create
    @authorization = Authorization.new(authorization_params)

    if @authorization.save
      redirect_to admin_authorizations_path
    else
      flash[:danger] = @authorization.errors.full_messages.to_sentence
      render 'new'
    end
  end
  
  def admin?
    unless user_is_admin?
      redirect_to admin_path
    end
  end
  
  def destroy
    @authorization = Authorization.find(params[:id])
    @authorization.destroy

    redirect_to admin_authorizations_path
  end
  
  private
    def authorization_params
      params.require(:authorization).permit(:user_id, :course_id)
    end
end
