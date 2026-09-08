class AddFimToReservas < ActiveRecord::Migration[8.1]
  def change
    add_column :reservas, :fim, :datetime
  end
end
