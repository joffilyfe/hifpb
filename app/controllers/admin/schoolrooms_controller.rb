class Admin::SchoolroomsController < Admin::AdminController
  include Admin::ImportHelper

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
    @schoolroom = Schoolroom.find(params[:id])
  end
  def edit
    @schoolroom = Schoolroom.find(params[:id])
  end

  def update
    @schoolroom = Schoolroom.find(params[:id])

    if @schoolroom.update(schoolroom_params)
      redirect_to admin_schoolrooms_path
    else
      flash[:danger] = @schoolroom.errors.full_messages.to_sentence
      render 'edit'
    end
  end

  def destroy
    @schoolroom = Schoolroom.find(params[:id])
    @schoolroom.destroy

    redirect_to admin_schoolrooms_path
  end

  private
    def schoolroom_params
      params.require(:schoolroom).permit(:maximum_capacity, :amount_resources, :status, :name, :initials)
    end
end
