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

    #bring the UF value
    def uf
      api_url = "https://mindicador.cl/api/uf/#{(params[:date])}"
      response = HTTParty.get(api_url)
      responsetohash = JSON.parse(response.read_body)
      if responsetohash['serie'][0].nil?
        return render json: {mensaje:"Valor no existe en esa fecha"}
      else 
        if request.headers['X-CLIENT'].present?
          Ufvaluerequest.create(client: request.headers['X-CLIENT'], requestedDate: "#{params[:date]}", ufvalue: responsetohash['serie'][0]['valor'] )
          render json: responsetohash['serie'][0]['valor']
        else
          return render json: {mensaje:"falta colocar key = X-CLIENT y en Header su nombre de cliente"}
        end
      end
    end

    #Bring my requests count and detail
    def my_requests
      name = params[:name]
      detail = []
      (Ufvaluerequest.where(client: name)).each do |consult|
        hash1 = {}
        hash1[:requestedDate] = consult.requestedDate
        hash1[:ufvalue] = consult.ufvalue
        hash1[:created_at] = consult.created_at
        detail.push(hash1)
      end
      hash = {"Cantidad de consultas": "#{Ufvaluerequest.where(client: name).count}", "Detalle de consultas": "#{detail}"}
      render json: hash
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
