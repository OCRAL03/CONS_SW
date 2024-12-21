# app/controllers/user_statistics_controller.rb
class UserStatisticsController < ApplicationController
  before_action :authenticate_user!

  def personalized
    @user = current_user
    @user_sleep_avg = @user.surveys.average(:hours_of_sleep) || 0
    @user_activity_avg = @user.surveys.average(:activity_minutes) || 0

    @recommendations = []
    if @user_sleep_avg < @user.ideal_sleep_hours
      @recommendations << "Dormir al menos #{@user.ideal_sleep_hours} horas diarias es esencial."
    end

    if @user_activity_avg < (150 if @user.gender == "male") || 120
      @recommendations << "Incrementa tu actividad física semanal para mejorar tu salud."
    else
      @recommendations << "¡Buen trabajo! Mantén tus niveles de actividad física."
    end
  end
end
