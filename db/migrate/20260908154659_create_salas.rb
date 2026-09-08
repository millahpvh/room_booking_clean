class CreateSalas < ActiveRecord::Migration[8.1]
  def change
    create_table :salas do |t|
      t.string :nome
      t.integer :capacidade
      t.string :localizacao

      t.timestamps
    end
  end
end
