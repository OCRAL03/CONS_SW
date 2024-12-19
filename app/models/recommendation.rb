class Recommendation < ApplicationRecord
    # Validaciones
    validates :title, presence: true
    validates :content, presence: true
    validates :category, inclusion: { in: %w[sleep water nutrition exercise general], 
                                      message: "%{value} no es una categoría válida" }
  
    # Scopes
    scope :by_category, ->(category) { where(category: category) }
  
    # Métodos personalizados
    def formatted_content
      "#{title}: #{content}"
    end
  end
  