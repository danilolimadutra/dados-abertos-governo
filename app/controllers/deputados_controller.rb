class DeputadosController < ApplicationController
  before_action :set_deputado, only: [:show, :edit, :update, :destroy]

  # GET /deputados
  # GET /deputados.json
  def index
    @deputados = Deputado.all
  end

  # GET /deputados/1
  # GET /deputados/1.json
  def show
  end

  # GET /deputados/new
  def new
    @deputado = Deputado.new
  end

  # GET /deputados/1/edit
  def edit
  end

  # POST /deputados
  # POST /deputados.json
  def create
    @deputado = Deputado.new(deputado_params)

    respond_to do |format|
      if @deputado.save
        format.html { redirect_to @deputado, notice: 'Deputado was successfully created.' }
        format.json { render :show, status: :created, location: @deputado }
      else
        format.html { render :new }
        format.json { render json: @deputado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deputados/1
  # PATCH/PUT /deputados/1.json
  def update
    respond_to do |format|
      if @deputado.update(deputado_params)
        format.html { redirect_to @deputado, notice: 'Deputado was successfully updated.' }
        format.json { render :show, status: :ok, location: @deputado }
      else
        format.html { render :edit }
        format.json { render json: @deputado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deputados/1
  # DELETE /deputados/1.json
  def destroy
    @deputado.destroy
    respond_to do |format|
      format.html { redirect_to deputados_url, notice: 'Deputado was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Listar deputados
  def listar
    @lista_deputados = DadosAbertosService.new().deputados
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deputado
      @deputado = Deputado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deputado_params
      params.require(:deputado).permit(:cod_dep, :uri, :nome, :sigla_partido, :uri_partido, :sigla_uf, :id_legislatura, :url_foto)
    end
end
