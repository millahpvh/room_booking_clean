class Reserva < ApplicationRecord
  belongs_to :sala

  validates :responsavel, :assunto, :inicio, :fim, presence: true

  validate :fim_deve_ser_posterior_ao_inicio
  validate :sala_deve_estar_disponivel

  private

  def fim_deve_ser_posterior_ao_inicio
    return if inicio.blank? || fim.blank?

    errors.add(:fim, :posterior_ao_inicio) if fim <= inicio
  end

  def sala_deve_estar_disponivel
    return if sala_id.blank? || inicio.blank? || fim.blank?

    existe_conflito = Reserva
      .where(sala_id: sala_id)
      .where.not(id: id)
      .where("inicio < ? AND fim > ?", fim, inicio)
      .exists?

    errors.add(:base, :horario_indisponivel) if existe_conflito
  end
end
