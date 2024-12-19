class Survey < ApplicationRecord
  # Asociaciones
  has_many :questions, dependent: :destroy
  accepts_nested_attributes_for :questions, allow_destroy: true
  
  belongs_to :user
  belongs_to :establishment
  has_many :responses, dependent: :destroy
  has_many :questions, dependent: :destroy

  # Validaciones
  validates :title, presence: true
  validates :description, length: { maximum: 500 }, allow_blank: true

  # Scopes
  scope :recent, -> { order(created_at: :desc) }
  scope :by_establishment, ->(establishment_id) { where(establishment_id: establishment_id) }

  # Métodos personalizados
  def response_summary
    questions.includes(:responses).map do |question|
      { question: question.text, summary: question.response_summary }
    end
  end
end
