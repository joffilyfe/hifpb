class Admin::LaboratoriesController < Admin::AdminController
  include Admin::ImportHelper

  def index
    @laboratories = Laboratory.all
  end

  def new
    @laboratory = Laboratory.new
  end

  def create
    @laboratory = Laboratory.new(laboratory_params)

    if @laboratory.save
      redirect_to admin_laboratories_path
    else
      flash[:danger] = @laboratory.errors.full_messages.to_sentence
      render 'new'
    end
  end


  def show
    @laboratory = Laboratory.find(params[:id])
  end
  def edit
    @laboratory = Laboratory.find(params[:id])
  end

  def update
    @laboratory = Laboratory.find(params[:id])

    if @laboratory.update(laboratory_params)
      redirect_to admin_laboratories_path
    else
      flash[:danger] = @laboratory.errors.full_messages.to_sentence
      render 'edit'
    end
  end

  def destroy
    @laboratory = Laboratory.find(params[:id])
    @laboratory.destroy

    redirect_to admin_laboratories_path
  end

  private
    def laboratory_params
      params.require(:laboratory).permit(:maximum_capacity, :amount_resources, :status, :name, :initials)
    end
end
