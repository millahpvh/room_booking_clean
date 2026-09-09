class Sala < ApplicationRecord
  has_many :reservas, dependent: :destroy

  validates :nome,
            presence: { message: "não pode ficar em branco" },
            uniqueness: {
              case_sensitive: false,
              message: "já está em uso"
            }

  validates :capacidade,
            presence: { message: "não pode ficar em branco" },
            numericality: {
              only_integer: true,
              greater_than: 0,
              allow_nil: true,
              message: "deve ser um número inteiro maior que zero"
            }

  validates :localizacao,
            presence: { message: "não pode ficar em branco" }
end
