class CreateDeputados < ActiveRecord::Migration[5.2]
  def change
    create_table :deputados do |t|
      t.integer :cod_dep
      t.string :uri
      t.string :nome
      t.string :sigla_partido
      t.string :uri_partido
      t.string :sigla_uf
      t.integer :id_legislatura
      t.string :url_foto

      t.timestamps
    end
  end
end
