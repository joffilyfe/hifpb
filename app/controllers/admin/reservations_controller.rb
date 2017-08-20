class   Admin::ReservationsController < Admin::AdminController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]


  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.all

  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new

  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to admin_reservations_path, notice: 'Reserva criada com sucesso.' }
      else
        format.html {  flash[:danger] = @reservation.errors.full_messages.to_sentence
             render :new }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:schoolroom_id,:laboratory_id,:date_reservation,:campus_schedule_id)
    end
end
