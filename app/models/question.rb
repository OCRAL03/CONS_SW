class Question < ApplicationRecord
  # Asociaciones
  belongs_to :survey
  has_many :responses, dependent: :destroy

  # Validaciones
  validates :text, presence: true

  # Métodos personalizados
  def total_responses
    responses.count
  end

  def response_summary
    responses.group(:answer).count
  end
  def statistics
    @survey = Survey.find(params[:id])
    @question_stats = @survey.questions.map do |question|
      { question: question.text, summary: question.response_summary }
    end
  end
  
end
