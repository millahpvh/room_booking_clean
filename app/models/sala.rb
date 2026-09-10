class Sala < ApplicationRecord
  has_many :reservas, dependent: :destroy

  validates :nome,
            presence: true,
            uniqueness: { case_sensitive: false }

  validates :capacidade,
            presence: true,
            numericality: {
              only_integer: true,
              greater_than: 0,
              allow_nil: true
            }

  validates :localizacao, presence: true
end
