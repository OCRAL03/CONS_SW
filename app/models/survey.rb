# app/models/survey.rb
class Survey < ApplicationRecord
  belongs_to :user
  belongs_to :establishment
  has_many :questions, dependent: :destroy
  has_many :responses, dependent: :destroy

  accepts_nested_attributes_for :questions, allow_destroy: true

  # Validaciones
  validates :title, presence: true
  validates :description, length: { maximum: 500 }, allow_blank: true

  # Métodos personalizados
  def sleep_analysis
    user.gender == "male" ? "Hombres: 7.5 horas ideales" : "Mujeres: 8 horas ideales"
  end

  def activity_analysis
    user.gender == "male" ? "Ejercicio moderado: 150 minutos por semana" : "Ejercicio moderado: 120 minutos por semana"
  end
end
