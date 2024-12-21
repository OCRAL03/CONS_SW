# app/models/user.rb
require 'bcrypt'

class User < ApplicationRecord
  include BCrypt
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Asociaciones
  has_many :surveys, dependent: :destroy

  # Validaciones
  validates :name, presence: true
  validates :gender, inclusion: { in: %w[male female], message: "%{value} no es un género válido" }
  validates :age, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 100, message: "debe estar entre 1 y 100 años" }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "no tiene un formato valido" }
  validates :weight, numericality: { greater_than: 0, message: "debe ser un número positivo" }, allow_nil: true
  validates :height, numericality: { greater_than: 0, message: "debe ser un número positivo" }, allow_nil: true
  validates :password, length: { minimum: 8, message: "debe tener al menos 8 caracteres" }, format: { with: /\A.*(?=.*[!@#$%^&*])(?=.*[A-Za-z]).*\z/, message: "debe incluir al menos una letra y un signo especial" }
  validates :encrypted_password, presence: true

  # Métodos personalizados
  # Setter para encriptar la contraseña antes de guardarla
  def password=(plain_password)
    return if plain_password.blank?

    self.encrypted_password = BCrypt::Password.create(plain_password)
  end

  # Método para autenticar usuarios
  def authenticate(plain_password)
    Password.new(self.encrypted_password) == plain_password
  end
  
  def imc
    return nil if height.nil? || weight.nil? || height.zero?

    (weight / (height**2)).round(2)
  end

  def imc_label
    case imc
    when nil then "No calculado"
    when 0..18.4 then "Bajo peso"
    when 18.5..24.9 then "Normal"
    when 25..29.9 then "Sobrepeso"
    else "Obesidad"
    end
  end

  def ideal_sleep_hours
    gender == "male" ? 7.5 : 8
  end

  def full_profile?
    name.present? && age.present? && gender.present?
  end
end
