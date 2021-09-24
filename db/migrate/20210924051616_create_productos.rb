class CreateProductos < ActiveRecord::Migration[6.1]
  def change
    create_table :productos do |t|
      t.string :nombre, null: false
      t.string :descripcion, null: false
      t.references :categoria, null: false, foreign_key: true

      t.timestamps
    end
  end
end