class CategoriaController < ApplicationController
  before_action :set_categorium, only: [:show, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
  rescue_from ActiveRecord::NotNullViolation, with: :handle_not_null
  rescue_from ActionController::ParameterMissing, with: :handle_parameter_missing

  rescue_from ActiveRecord::InvalidForeignKey, with: :handle_invalid_foreign_key

  # GET /categoria
  def index
    @categoria = Categoria.all

    render json: @categoria
  end

  # GET /categoria/1
  def show
    render json: @categorium
  end

  # POST /categoria
  def create
    if params[:nombre] == ""
      render json: { message: "No se puede agregar un nombre de categoria vacio" }
    else 
      @categorium = Categoria.new(categorium_params)

      if @categorium.save
        render json: @categorium, status: :created, location: @categorium
      else
        render json: @categorium.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /categoria/1
  def update
    if @categorium.update(categorium_params)
      render json: @categorium
    else
      render json: @categorium.errors, status: :unprocessable_entity
    end
  end

  # DELETE /categoria/1
  def destroy
    @categorium.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categorium
      @categorium = Categoria.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def categorium_params
      params.require(:categorium).permit(:nombre, :descripcion)
    end

    def handle_record_not_found
      render json: {message: "id no valido"}
    end

    def handle_not_null
      render json: {message: "No se pueden agregar categorias si falta la caracteristica nombre"}
    end

    def handle_parameter_missing
      render json: {message: "Parametro de categoria no valido"}
    end

    def handle_invalid_foreign_key
      render json: {message: "No se puede eliminar una categoria con productos"}
    end

end
