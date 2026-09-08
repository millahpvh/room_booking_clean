json.extract! reserva, :id, :responsavel, :assunto, :inicio, :sala_id, :created_at, :updated_at
json.url reserva_url(reserva, format: :json)
