class Admin::SchoolroomsController < Admin::AdminController
  include Admin::ImportHelper
  before_action :set_classroom, only: [:show, :edit, :update, :destroy]
  before_action :set_authorization, only: [:index, :create, :show, :edit, :update, :destroy]

  def index
    @schoolrooms = Schoolroom.all
  end

  def new
    @schoolroom = Schoolroom.new
  end

  def create
    @schoolroom = Schoolroom.new(schoolroom_params)
    if @schoolroom.save
      redirect_to admin_schoolrooms_path
    else
      flash[:danger] = @schoolroom.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def show

  end
  
  def edit

  end

  def update
    if @schoolroom.update(schoolroom_params)
      redirect_to admin_schoolrooms_path
    else
      flash[:danger] = @schoolroom.errors.full_messages.to_sentence
      render 'edit'
    end
  end

  def destroy
    @schoolroom.destroy
    redirect_to admin_schoolrooms_path
  end

  private
    def set_classroom
      @schoolroom = Schoolroom.find(params[:id])
    end

    def set_authorization
      authorize Schoolroom
    end

    def schoolroom_params
      params.require(:schoolroom).permit(:maximum_capacity, :amount_resources, :status, :name, :initials)
    end
end
