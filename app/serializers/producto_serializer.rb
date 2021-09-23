class ProductoSerializer < ActiveModel::Serializer
  attributes :id, :nombre, :descripcion
  has_one :categoria
  class CategoriaSerializer < ActiveModel::Serializer
    attributes :id, :nombre
  end
end
