require "test_helper"

class CategoriaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @categorium = categoria(:one)
  end

  test "should get index" do
    get categoria_index_url, as: :json
    assert_response :success
  end

  test "should create categorium" do
    assert_difference('Categoria.count') do
      post categoria_index_url, params: { categorium: { descripcion: @categorium.descripcion, nombre: @categorium.nombre } }, as: :json
    end

    assert_response 201
  end

  test "should show categorium" do
    get categorium_url(@categorium), as: :json
    assert_response :success
  end

  test "should update categorium" do
    patch categorium_url(@categorium), params: { categorium: { descripcion: @categorium.descripcion, nombre: @categorium.nombre } }, as: :json
    assert_response 200
  end

  test "should destroy categorium" do
    assert_difference('Categoria.count', -1) do
      delete categorium_url(@categorium), as: :json
    end

    assert_response 204
  end
end
