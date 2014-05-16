class SociosController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorize_user!

  before_action :set_socio, only: [:show, :edit, :update, :destroy]

  # GET /socios
  # GET /socios.json
  def index
    @q = Socio.search(params[:q])
    @socios = @q.result.paginate page: params[:page], per_page: 5
    respond_to do |format|
      format.html
      format.js# {render partial: "socios/socio_rows", locals: {socios: @socios}}
    end
  end

  # GET /socios/1
  # GET /socios/1.json
  def show
  end

  # GET /socios/new
  def new
    @socio = Socio.new
  end

  # GET /socios/1/edit
  def edit
  end

  # POST /socios
  # POST /socios.json
  def create
    @socio = Socio.new(socio_params)
    respond_to do |format|
      if @socio.save
        format.html { redirect_to new_socio_path, notice: 'El socio fue creado correctamente.' }
        format.json { render action: 'show', status: :created, location: @socio }
      else
        format.html { render action: 'new' }
        format.json { render json: @socio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /socios/1
  # PATCH/PUT /socios/1.json
  def update
    respond_to do |format|
      if @socio.update(socio_params)
        format.html { redirect_to @socio, notice: 'Socio was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @socio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /socios/1
  # DELETE /socios/1.json
  def destroy
    @socio.destroy
    respond_to do |format|
      format.html { redirect_to socios_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socio
      @socio = Socio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def socio_params
      params.require(:socio).permit(:nombre, :dni, :domicilio, :email, :fecha_alta, :fecha_baja, :comentario, :activo, :categoria_id)
    end

    def authorize_user!
      authorize Socio
    end

end
