class Admin::LaboratoriesController < Admin::AdminController
  include Admin::ImportHelper
  before_action :set_lab, only: [:show, :edit, :update, :destroy]
  before_action :set_authorization, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  def index
    authorize Laboratory
    @laboratories = Laboratory.all
  end

  def new
    @laboratory = Laboratory.new
  end

  def create
    authorize Laboratory
    @laboratory = Laboratory.new(laboratory_params)

    if @laboratory.save
      redirect_to admin_laboratories_path
    else
      flash[:danger] = @laboratory.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def show
  end
  
  def edit
  end

  def update
    if @laboratory.update(laboratory_params)
      redirect_to admin_laboratories_path
    else
      flash[:danger] = @laboratory.errors.full_messages.to_sentence
      render 'edit'
    end
  end

  def destroy
    @laboratory.destroy
    redirect_to admin_laboratories_path
  end



  private
    def set_lab
      @laboratory = Laboratory.find(params[:id])
    end

    def set_authorization
      authorize Laboratory
    end
    
    def laboratory_params
      params.require(:laboratory).permit(:maximum_capacity, :amount_resources, :status, :name, :initials)
    end
end
