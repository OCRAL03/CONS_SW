class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
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
