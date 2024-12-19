def new
  @survey = Survey.find(params[:survey_id])
  @responses = @survey.questions.map { |q| @survey.responses.build(question: q) }
end

def create
  @survey = Survey.find(params[:survey_id])
  @responses = @survey.responses.build(response_params)

  if @responses.map(&:save).all?
    redirect_to survey_path(@survey), notice: 'Respuestas guardadas exitosamente.'
  else
    render :new
  end
end

private

def response_params
  params.require(:responses).map do |response|
    response.permit(:question_id, :answer)
  end
end
