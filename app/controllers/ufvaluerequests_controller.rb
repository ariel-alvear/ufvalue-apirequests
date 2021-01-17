class UfvaluerequestsController < ApplicationController
  before_action :set_ufvaluerequest, only: [:show, :update, :destroy]

  # GET /ufvaluerequests
  def index
    @ufvaluerequests = Ufvaluerequest.all

    render json: @ufvaluerequests
  end

  # GET /ufvaluerequests/1
  def show
    render json: @ufvaluerequest
  end

  # POST /ufvaluerequests
  def create
    @ufvaluerequest = Ufvaluerequest.new(ufvaluerequest_params)

    if @ufvaluerequest.save
      render json: @ufvaluerequest, status: :created, location: @ufvaluerequest
    else
      render json: @ufvaluerequest.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ufvaluerequests/1
  def update
    if @ufvaluerequest.update(ufvaluerequest_params)
      render json: @ufvaluerequest
    else
      render json: @ufvaluerequest.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ufvaluerequests/1
  def destroy
    @ufvaluerequest.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ufvaluerequest
      @ufvaluerequest = Ufvaluerequest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ufvaluerequest_params
      params.require(:ufvaluerequest).permit(:client, :requestedDate, :ufvalue)
    end
end
