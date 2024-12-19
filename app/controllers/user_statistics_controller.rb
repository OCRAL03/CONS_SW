class UserStatisticsController < ApplicationController
    before_action :authenticate_user! # Solo usuarios autenticados
  
    def personalized
      @user_sleep_avg = current_user.surveys.average(:hours_of_sleep) || 0
      @sleep_comparison = {
        "Menos de lo Ideal (<7 horas)" => @user_sleep_avg < 7 ? @user_sleep_avg : 0,
        "Rango Ideal (7-9 horas)" => (@user_sleep_avg >= 7 && @user_sleep_avg <= 9) ? @user_sleep_avg : 0,
        "Más de lo Ideal (>9 horas)" => @user_sleep_avg > 9 ? @user_sleep_avg : 0
      }
  
      @user_activity_avg = current_user.surveys.average(:activity_minutes) || 0
      @activity_comparison = {
        "Baja Actividad (<150 minutos)" => @user_activity_avg < 150 ? @user_activity_avg : 0,
        "Rango Ideal (>150 minutos)" => @user_activity_avg >= 150 ? @user_activity_avg : 0
      }
    end
  
    def recommendations
      @recommendations = []
    
      # Recomendaciones basadas en horas de sueño
      if @user_sleep_avg < 7
        @recommendations << "Dormir al menos 7-9 horas por día mejora la concentración y el rendimiento físico."
      elsif @user_sleep_avg > 9
        @recommendations << "Dormir demasiado puede ser signo de otros problemas. Equilibra tu tiempo."
      end
  
      # Actividad física
      if @user_activity_avg < 150
        @recommendations << "Incrementa tu actividad física a 150 minutos por semana para una mejor salud."
      else
        @recommendations << "¡Buen trabajo! Tu actividad física está en el nivel recomendado."
      end
    end
    
  end
  