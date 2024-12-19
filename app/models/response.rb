class Response < ApplicationRecord
  # Asociaciones
  belongs_to :survey
  belongs_to :question

  # Validaciones
  validates :question_id, presence: true
  validates :answer, presence: true

  # Métodos personalizados
  def to_s
    "#{question.text}: #{answer}"
  end
end
