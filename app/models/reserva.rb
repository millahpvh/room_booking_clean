class Reserva < ApplicationRecord
  belongs_to :sala

  validates :responsavel,
            presence: { message: "não pode ficar em branco" }

  validates :assunto,
            presence: { message: "não pode ficar em branco" }

  validates :inicio,
            presence: { message: "não pode ficar em branco" }

  validates :fim,
            presence: { message: "não pode ficar em branco" }

  validates :sala,
            presence: { message: "deve ser selecionada" }

  validate :fim_deve_ser_posterior_ao_inicio
  validate :sala_deve_estar_disponivel

  private

  def fim_deve_ser_posterior_ao_inicio
    return if inicio.blank? || fim.blank?

    if fim <= inicio
      errors.add(:fim, "deve ser posterior ao início")
    end
  end

  def sala_deve_estar_disponivel
    return if sala_id.blank? || inicio.blank? || fim.blank?

    existe_conflito = Reserva
      .where(sala_id: sala_id)
      .where.not(id: id)
      .where("inicio < ? AND fim > ?", fim, inicio)
      .exists?

    if existe_conflito
      errors.add(:base, "A sala já está reservada nesse horário")
    end
  end
end
