class Reserva < ApplicationRecord
  belongs_to :sala

  validates :responsavel, :assunto, :inicio, :fim, presence: true

  validate :fim_deve_ser_posterior_ao_inicio
  validate :sala_deve_estar_disponivel
  validate :inicio_nao_pode_estar_no_passado, if: :will_save_change_to_inicio?
  validate :participantes_nao_podem_exceder_capacidade
  validate :datas_nao_podem_ultrapassar_limite, if: :inicio_ou_fim_foram_alterados?

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

  def inicio_nao_pode_estar_no_passado
    return if inicio.blank?

    errors.add(:inicio, :no_passado) if inicio < Time.current
  end

  def participantes_nao_podem_exceder_capacidade
    return if participantes.blank? || sala.blank? || sala.capacidade.blank?

    quantidade = participantes.lines.count { |linha| linha.strip.present? }

    if quantidade > sala.capacidade
      errors.add(
        :participantes,
        :excedem_capacidade,
        capacidade: sala.capacidade
      )
    end
  end

  def inicio_ou_fim_foram_alterados?
    will_save_change_to_inicio? || will_save_change_to_fim?
  end

  def datas_nao_podem_ultrapassar_limite
    limite = 2.years.from_now

    errors.add(:inicio, :muito_distante) if inicio.present? && inicio > limite
    errors.add(:fim, :muito_distante) if fim.present? && fim > limite
  end
end
