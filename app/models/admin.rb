class Admin < ApplicationRecord
  # Devise módulos
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  # Asociaciones
  has_and_belongs_to_many :establishments

  # Validaciones
  validates :name, presence: true

  # Métodos personalizados
  def assigned_establishments
    establishments.map(&:name).join(', ')
  end

  def total_surveys_managed
    establishments.joins(:surveys).count
  end
end
