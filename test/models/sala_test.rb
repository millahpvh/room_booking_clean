require "test_helper"

class SalaTest < ActiveSupport::TestCase
  test "nao exclui sala que possui reservas" do
    sala = Sala.create!(
      nome: "Sala protegida pelo teste",
      capacidade: 10,
      localizacao: "Primeiro andar"
    )

    inicio = 2.days.from_now

    reserva = sala.reservas.create!(
      responsavel: "Pessoa de teste",
      assunto: "Reunião de teste",
      inicio: inicio,
      fim: inicio + 1.hour
    )

    assert_not sala.destroy
    assert Sala.exists?(sala.id)
    assert Reserva.exists?(reserva.id)
  end
end
