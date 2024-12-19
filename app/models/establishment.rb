class Establishment < ApplicationRecord
    # Asociaciones
    has_many :surveys, dependent: :destroy
    has_and_belongs_to_many :admins
  
    # Validaciones
    validates :name, presence: true
    validates :location, presence: true
  
    # Métodos personalizados
    def total_surveys
      surveys.count
    end
  
    def surveys_last_month
      surveys.where('created_at >= ?', 1.month.ago).count
    end
  end
  