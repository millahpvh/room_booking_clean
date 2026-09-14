class AddParticipantesEObservacoesToReservas < ActiveRecord::Migration[8.1]
  def change
    add_column :reservas, :participantes, :text
    add_column :reservas, :observacoes, :text
  end
end
