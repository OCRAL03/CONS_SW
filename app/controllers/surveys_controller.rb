class SurveysController < ApplicationController
  before_action :authenticate_user! # Solo usuarios autenticados pueden completar encuestas
  before_action :set_survey, only: %i[show edit update destroy]

  def index
    @surveys = current_user.surveys
  end

  def show
  end

  def new
    @survey = current_user.surveys.build
  end

  def create
    @survey = current_user.surveys.build(survey_params)
    if @survey.save
      redirect_to surveys_path, notice: 'Encuesta creada exitosamente.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @survey.update(survey_params)
      redirect_to survey_path(@survey), notice: 'Encuesta actualizada correctamente.'
    else
      render :edit
    end
  end

  def destroy
    @survey.destroy
    redirect_to surveys_path, notice: 'Encuesta eliminada correctamente.'
  end

  private

  def set_survey
    @survey = current_user.surveys.find(params[:id])
  end

  def survey_params
    params.require(:survey).permit(:title, :description, :hours_of_sleep, :activity_level, :age, :gender)
  end
end

def new
  @survey = current_user.surveys.build
  @survey.questions.build # Inicializa una pregunta por defecto
end

def create
  @survey = current_user.surveys.build(survey_params)
  if @survey.save
    redirect_to surveys_path, notice: 'Encuesta creada exitosamente.'
  else
    render :new
  end
end

private

def survey_params
  params.require(:survey).permit(:title, :description, questions_attributes: [:id, :text, :_destroy])
end

