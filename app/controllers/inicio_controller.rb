class InicioController < ApplicationController
  def index
    @total_salas = Sala.count
    @total_reservas = Reserva.count

    @proximas_reservas = Reserva
      .includes(:sala)
      .where("inicio >= ?", Time.current)
      .order(:inicio)
      .limit(5)
  end
end
