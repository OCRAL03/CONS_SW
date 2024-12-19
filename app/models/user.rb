class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Devise módulos
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Asociaciones
  has_many :surveys, dependent: :destroy

  # Validaciones
  validates :name, presence: true
  validates :age, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
  validates :gender, inclusion: { in: %w[male female other], message: "%{value} no es un género válido" }, allow_nil: true

  # Métodos personalizados
  def full_profile?
    name.present? && age.present? && gender.present?
  end

  def total_surveys
    surveys.count
  end

  def latest_survey
    surveys.order(created_at: :desc).first
  end
end
