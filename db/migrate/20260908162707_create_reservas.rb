class CreateReservas < ActiveRecord::Migration[8.1]
  def change
    create_table :reservas do |t|
      t.string :responsavel
      t.string :assunto
      t.datetime :inicio
      t.references :sala, null: false, foreign_key: true

      t.timestamps
    end
  end
end
