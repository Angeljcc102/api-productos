class ProductosController < ApplicationController
  before_action :set_producto, only: [:show, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
  rescue_from ActiveRecord::NotNullViolation, with: :handle_not_null
  rescue_from ActionController::ParameterMissing, with: :handle_parameter_missing

  # GET /productos
  def index
    @productos = Producto.all

    render json: @productos
  end

  # GET /productos/1
  def show
    render json: @producto
  end

  # POST /productos
  def create
    if params[:nombre] == "" || params[:descripcion] == ""
      render json: { message: "No se puede agregar un atributo del producto vacio" }
    else
      @producto = Producto.new(producto_params)

      if @producto.save
        render json: @producto, status: :created, location: @producto
      else
        render json: @producto.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /productos/1
  def update
    if @producto.update(producto_params)
      render json: @producto
    else
      render json: @producto.errors, status: :unprocessable_entity
    end
  end

  # DELETE /productos/1
  def destroy
    @producto.destroy

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_producto
      @producto = Producto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def producto_params
      params.require(:producto).permit(:nombre, :descripcion, :categoria_id)
    end

    def handle_record_not_found
      render json: {message: "id no valido"}
    end

    def handle_not_null
      render json: {message: "No se pueden agregar productos si falta alguna caracteristica"}
    end

    def handle_parameter_missing
      render json: {message: "Parametro de producto no valido"}
    end

end
