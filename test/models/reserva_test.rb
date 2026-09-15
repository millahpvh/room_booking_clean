require "test_helper"

class ReservaTest < ActiveSupport::TestCase
  test "não permite criar reserva com início no passado" do
    reserva = Reserva.new(
      responsavel: "Camila",
      assunto: "Reunião de teste",
      inicio: 1.hour.ago,
      fim: 1.hour.from_now,
      sala: salas(:one)
    )

    assert_not reserva.valid?
    assert_includes reserva.errors[:inicio], "não pode estar no passado"
  end

  test "não permite participantes acima da capacidade da sala" do
    sala = Sala.new(
      nome: "Sala de teste",
      capacidade: 2,
      localizacao: "1º andar"
    )

    inicio = 1.day.from_now

    reserva = Reserva.new(
      responsavel: "Camila",
      assunto: "Reunião lotada",
      inicio: inicio,
      fim: inicio + 1.hour,
      sala: sala,
      participantes: "Billy\nNala\nRômulo"
    )

    assert_not reserva.valid?
    assert_includes(
      reserva.errors[:participantes],
      "excedem a capacidade da sala, que comporta 2 pessoas"
    )
  end
end
