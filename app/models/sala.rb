class Sala < ApplicationRecord
  has_many :reservas, dependent: :destroy
end
