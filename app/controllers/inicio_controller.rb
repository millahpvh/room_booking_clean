class InicioController < ApplicationController
  def index
    agora = Time.current

    @total_salas = Sala.count
    @total_reservas = Reserva.count
    @reservas_hoje = Reserva.where(inicio: agora.all_day).count
    @reservas_futuras = Reserva.where("inicio >= ?", agora).count
    @atualizado_em = agora

    @proximas_reservas = Reserva
      .includes(:sala)
      .where("inicio >= ?", agora)
      .order(:inicio)
      .limit(5)
  end
end
