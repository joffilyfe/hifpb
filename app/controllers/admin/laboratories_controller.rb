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
    respond_to do |format|
      if @laboratory.save
        format.html { redirect_to admin_laboratories_path, notice: 'Laboratorio cadastrado com sucesso.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @laboratory.update(laboratory_params)
        format.html { redirect_to admin_laboratories_path, notice: 'Laboratorio atualizado com sucesso.' }
      else
        format.html { render :edit }
      end
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
      params.require(:laboratory).permit(:maximum_capacity, :amount_resources, :status, :name, :initials, :campus_id)
    end
end
